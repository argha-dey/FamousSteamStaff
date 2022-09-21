import 'package:famous_steam_staff/bloc/service_list_bloc.dart';
import 'package:famous_steam_staff/common/custom_appbar.dart';
import 'package:famous_steam_staff/common/text.dart';
import 'package:famous_steam_staff/global/color.dart';

import 'package:famous_steam_staff/model/service_list_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../bottombar/homePage2.dart';
import '../localizations/app_localizations.dart';
import 'orderDetails.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  DateTime initialdate = DateTime.now();
  Future<DateTime> selectDate(
      BuildContext context, DateTime _date, String type) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2018),
        lastDate: DateTime(2030),
        currentDate: DateTime.now());
    if (picked != null) {
      setState(() {
        _date = picked;
      });
    }
    return _date;
  }

  @override
  void initState() {
    super.initState();

    servicelistbloc.serviceliststreamsink(
        'eng', DateFormat('yyyy-MM-dd').format(initialdate));
  }

  List filterList = [
    {
      'number': '#1234LM',
      'wait': '(5mins left)',
      'status': 'Waiting',
    },
    {
      'number': '#1234LM',
      'wait': '',
      'status': 'Job Started',
    },
    {
      'number': '#1234LM',
      'wait': '',
      'status': 'Accepted',
    },
    {
      'number': '#1234LM',
      'wait': '',
      'status': 'job Finished',
    },
    {
      'number': '#1234LM',
      'wait': '',
      'status': 'On The Way',
    },
    {
      'number': '#1234LM',
      'wait': '',
      'status': 'Arrived',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: WidgetAppBar(

          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            // ignore: deprecated_member_use
            notification.disallowGlow();
            return true;
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 19.0,
                top: 19.0,
                right: 19.0,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 15.0),
                  serviceListText(),
                  const SizedBox(height: 34.0),
                  filterText(),
                  const SizedBox(height: 12.0),
                  serviceList(),
                  const SizedBox(height: 12.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget serviceList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0.0, 2.0),
            spreadRadius: 0.0,
            blurRadius: 5.0,
          )
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 11.0,
              vertical: 14.0,
            ),
            child: StreamBuilder<ServicelistModel>(
                stream: servicelistbloc.serviceliststream,
                builder: (context,
                    AsyncSnapshot<ServicelistModel> servicelistsnapshot) {
                  if (!servicelistsnapshot.hasData) {
                    return const Center(

                    );
                  }

                    return Row(
                      children: [
                 /*       servicelistsnapshot.data!.data!.isNotEmpty?Column(

                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: extraPackageServiceList(servicelistsnapshot.data!.data!),
                        ):Text("No Extra Service Added", style: GoogleFonts.montserrat(
                            textStyle: TextStyle( color: AppColor.appColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14)),),*/


                        const Spacer(),
                        AppText(
                          DateFormat('dd-MM-yyyy').format(initialdate),
                          color: AppColor.lightButtonColor,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(width: 8.0),
                        GestureDetector(
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          primary: AppColor.black,
                                        ),
                                      ),
                                      textTheme: const TextTheme()),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 80.0, bottom: 80),
                                    child: Container(child: child!),
                                  ),
                                );
                              },
                              initialDate: initialdate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2030),
                            );
                            if (picked != null && picked != initialdate) {
                              servicelistbloc.serviceliststreamsink('eng',
                                  DateFormat('yyyy-MM-dd').format(picked));
                              setState(() {
                                initialdate = picked;
                              });
                            }
                          },
                          child: Image.asset(
                            'assets/images/calender.png',
                            height: 24.0,
                            width: 24.0,
                          ),
                        ),
                      ],
                    );

                }),
          ),
          const Divider(
            color: Color(0xffC4C4C4),
            height: 0.0,
          ),
          StreamBuilder<ServicelistModel>(
              stream: servicelistbloc.serviceliststream,
              builder: (context,
                  AsyncSnapshot<ServicelistModel> servicelistsnapshot) {
                if (!servicelistsnapshot.hasData) {
                  return const Center(

                  );
                }

                return Container(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    top: 15.0,
                    right: 10.0,
                  ),
                  child: servicelistsnapshot.data!.data!.length == 0 ? Center(
                    child: Text("No Orders found!"),
                  )
                  :ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: servicelistsnapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                          height: 42.0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                          ),
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Colors.transparent
                                : const Color(0xffF1F9FF),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              AppText(
                                "# ${servicelistsnapshot.data!.data![index].orderDisplayId}",
                                color: AppColor.lightButtonColor,
                                fontWeight: FontWeight.w500,
                              ),
                              const Spacer(),
                              AppText(
                              /*  servicelistsnapshot.data!.data![index].orderStatus??"",*/  servicelistsnapshot.data!.data![index].staffOrderStatus==null? servicelistsnapshot.data!.data![index].orderStatus??"" :servicelistsnapshot.data!.data![index].staffOrderStatus!.updateButton,
                                color: servicelistsnapshot.data!
                                    .data![index].orderStatus ==
                                    'complete'
                                    ? AppColor.green
                                    : AppColor.yellow,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderDetailsScreen(
                                id: servicelistsnapshot.data!.data![index].orderId.toString(),
                                status:servicelistsnapshot.data!.data![index].staffOrderStatus==null? servicelistsnapshot.data!.data![index].orderStatus??"" :servicelistsnapshot.data!.data![index].staffOrderStatus!.updateButton,
                                statusColor: servicelistsnapshot.data!
                                    .data![index].orderStatus! ==
                                    'Accepted'
                                    ? AppColor.green
                                    : AppColor.yellow,
                                 staff_status_id:servicelistsnapshot.data!.data![index].staffOrderStatus==null?"0":servicelistsnapshot.data!.data![index].staffOrderStatus!.staffOrderStatusId.toString(),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 15.0);
                    },
                  ),
                );
              }),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  Widget filterText() {
    return InkWell(
      onTap: () async{
        final DateTime? picked = await showDatePicker(
          context: context,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      primary: AppColor.black,
                    ),
                  ),
                  textTheme: const TextTheme()),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 80.0, bottom: 80),
                child: Container(child: child!),
              ),
            );
          },
          initialDate: initialdate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2030),
        );
        if (picked != null && picked != initialdate) {
          servicelistbloc.serviceliststreamsink('eng',
              DateFormat('yyyy-MM-dd').format(picked));
          setState(() {
            initialdate = picked;
          });
        }
      } ,
      child:  Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          'assets/images/filter.png',
          height: 14.0,
          width: 14.0,
        ),
        const SizedBox(width: 7.0),
        AppText(
          Translation.of(context)!.translate('filter')!,
          color: AppColor.black,
          fontWeight: FontWeight.w500,
        ),
      ],
    ),
    );

  }
  List<Widget> extraPackageServiceList(List<Data> selectedServiceData ) {
    List<Widget> widgets = [];
    for (Data total in selectedServiceData!) {
      widgets.add(

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              "Total Service : ${total!.totalAmount.toString()}",
              color: AppColor.appColor,
              fontWeight: FontWeight.w600,
            ),

          ],
        ),

      );
    }
    return widgets;
  }
  Widget serviceListText() {
    return AppText(
      Translation.of(context)!.translate('servicelist')!,
      color: AppColor.appColor,
      size: 18.0,
      fontWeight: FontWeight.w600,
    );
  }


}
