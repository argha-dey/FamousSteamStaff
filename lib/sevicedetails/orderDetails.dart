import 'package:dotted_line/dotted_line.dart';
import 'package:famous_steam_staff/bloc/servicedetail_bloc.dart';
import 'package:famous_steam_staff/common/custom_appbar.dart';
import 'package:famous_steam_staff/common/text.dart';
import 'package:famous_steam_staff/global/color.dart';
import 'package:famous_steam_staff/localizations/app_localizations.dart';
import 'package:famous_steam_staff/model/servicedetail_model.dart';
import 'package:famous_steam_staff/sevicedetails/steper_service_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as UI;

import '../global/prefskey.dart';
import 'get_rating.dart';

class OrderDetailsScreen extends StatefulWidget {
  String id;

  String status;
  String staff_status_id;
  Color statusColor;
  OrderDetailsScreen(
      {Key? key,
      required this.status,
      required this.statusColor,
      required this.id,  required this.staff_status_id}
)
      : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  void initState() {
    super.initState();
    servicedetailbloc.servicedetailstreamsink(widget.id, 'eng');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: WidgetAppBar(
          menuItem: Icons.arrow_back_ios,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.only(
            left: 19.0,
            top: 19.0,
            right: 19.0,
          ),
          child: Column(
            children: [
              serviceDetails(),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
      floatingActionButton: widget.staff_status_id == "8"?Container(): floatingActionButton()
    );
  }
  Widget floatingActionButton(){
    return   StreamBuilder<ServicedetailModel>(
        stream: servicedetailbloc.servicedetailstream,
        builder: (context,
            AsyncSnapshot<ServicedetailModel> serviceDetailssnapshot) {
          if (!serviceDetailssnapshot.hasData) {
            return const Center(

            );
          }
          {
            return FloatingActionButton(
              backgroundColor: Colors.white,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SteperServiceDetails(widget.id, serviceDetailssnapshot.data!.data!.staffStatus ?? "0",serviceDetailssnapshot.data!.data!.userAddress!.latitude,serviceDetailssnapshot.data!.data!.userAddress!.longitude,widget.status,widget.statusColor,serviceDetailssnapshot.data!.data!.user.mobile)));
                },
                child: Image.asset(
                  'assets/images/btn_play_shape.png',
                  height: 28.0,
                  width: 28.0,
                ),
              ),
              onPressed: () {},
            );
          }
        });
  }

  Widget serviceDetails() {
    return StreamBuilder<ServicedetailModel>(
        stream: servicedetailbloc.servicedetailstream,
        builder: (context,
            AsyncSnapshot<ServicedetailModel> serviceDetailssnapshot) {
          if (!serviceDetailssnapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    top: 15.0,
                    right: 24.0,
                  ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AppText(
                            'Status',
                            color: AppColor.appColor,
                            fontWeight: FontWeight.w600,
                          ),
                          const Spacer(),


                          AppText(
                            widget.status,
                            color: widget.statusColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      const SizedBox(height: 13.0),
                      const DottedLine(
                        direction: Axis.horizontal,
                        lineLength: double.infinity,
                        dashLength: 2.0,
                        dashGapLength: 2.5,
                        dashColor: AppColor.lightButtonColor,
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            Translation.of(context)!.translate('Order No')!,
                            color: AppColor.black,
                          ),
                          AppText(
                            "#"+serviceDetailssnapshot.data!.data!.orderDisplayId
                                .toString(),
                            color: AppColor.black,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            Translation.of(context)!.translate('Service Value')!,
                            color: AppColor.black,
                          ),
                          AppText(
                            'SAR : ${serviceDetailssnapshot.data!.data!.totalAmount} ',
                            color: AppColor.black,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),

                          AppText(
                            Translation.of(context)!.translate('packagename')!,
                            color: AppColor.black,
                          ),
                          AppText(
                            serviceDetailssnapshot.data!.data!.package!.packageName.toString(),
                            color: AppColor.black,

                      ),
                      const SizedBox(height: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            Translation.of(context)!.translate('extraservicedetails')!,
                            color: AppColor.black,
                          ),

                          serviceDetailssnapshot
                                  .data!.data!.extraService!.isNotEmpty
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: extraPackageServiceList(
                                      serviceDetailssnapshot
                                          .data!.data!.extraService!),
                                )
                              : Text(
                            Translation.of(context)!.translate('No Extra Service Added')!,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: AppColor.appColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)),
                                ),
                        ],
                      ),
                      const SizedBox(height: 13.0),
                      const DottedLine(
                        direction: Axis.horizontal,
                        lineLength: double.infinity,
                        dashLength: 2.0,
                        dashGapLength: 2.5,
                        dashColor: AppColor.lightButtonColor,
                      ),
                      const SizedBox(height: 13.0),
                      AppText(
                        Translation.of(context)!.translate('Slot Date')!,
                        color: AppColor.black,
                      ),
                      const SizedBox(height: 11.0),
                      AppText(
                        serviceDetailssnapshot.data!.data!.appointmentDate
                            .toString(),
                        color: AppColor.black,
                        fontWeight: FontWeight.w300,
                      ),
                      const SizedBox(height: 13.0),
                      AppText(
                        Translation.of(context)!.translate('Slot Time')!,
                        color: const Color.fromRGBO(47, 47, 47, 1),
                      ),
                      const SizedBox(height: 11.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Directionality(
                            textDirection: UI.TextDirection.ltr,
                            child:  Text(
                              serviceDetailssnapshot.data!.data!.timeslotId.toString(),locale: Locale('eng'),
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: AppColor.black,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ),
                          ),


                        ],
                      ),
                      const SizedBox(height: 16.0),
                      AppText(
                        Translation.of(context)!.translate('vehicledetails')!,
                        color: AppColor.black,
                      ),
                      const SizedBox(height: 11.0),
                      AppText(
                        serviceDetailssnapshot.data!.data!.brand!.name
                            .toString(),
                        color: AppColor.black,
                        fontWeight: FontWeight.w300,
                      ),
                      const SizedBox(height: 11.0),
                      AppText(
                        Translation.of(context)!.translate('vehiclesize')!,
                        color: AppColor.black,
                      ),
                      const SizedBox(height: 11.0),
                      AppText(
                        serviceDetailssnapshot.data!.data!.carSize!.sizeName.toString()+" - "+  serviceDetailssnapshot.data!.data!.year!.yearName.toString(),
                        color: AppColor.black,
                        fontWeight: FontWeight.w300,
                      ),
                      const SizedBox(height: 16.0),
                      AppText(
                        Translation.of(context)!.translate('PickUp Location')!,
                        color: AppColor.black,
                      ),
                      const SizedBox(height: 11.0),
                      AppText(
                        serviceDetailssnapshot.data!.data!.pickupAddress!,
                        color: AppColor.black,
                        fontWeight: FontWeight.w300,
                      ),
                      const SizedBox(height: 30.0),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
             if(widget.staff_status_id == "8")
             Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 19.0,
                    vertical: 13.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(0.0, 2.0),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RatingBarIndicator(
                        itemSize: 20,
                        rating:  serviceDetailssnapshot.data!.data!.rating==null? 0: parseAmount(serviceDetailssnapshot
                            .data!.data!.rating!.ratingData.toStringAsFixed(2)),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color:  widget.statusColor,
                        ),
                        itemCount: 5,
                        direction: Axis.horizontal,
                      ),

                      SizedBox(width: 25),
                      serviceDetailssnapshot.data!.data!.rating==null?Text(
                        ' Give Rating',
                        style: GoogleFonts.montserrat(
                          fontSize: 14.0,
                          color: const Color(0xff004471),
                          fontWeight: FontWeight.w500,
                        ),
                      ):Text(
                        'You have already rated',
                        style: GoogleFonts.montserrat(
                          fontSize: 14.0,
                          color: const Color(0xff004471),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      serviceDetailssnapshot.data!.data!.rating==null? InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReviewAndRatingPage(
                                orderId: serviceDetailssnapshot
                                    .data!.data!.orderId
                                    .toString() ?? "",
                                modelId: serviceDetailssnapshot
                                    .data!.data!.user!.id
                                    .toString() ?? "",
                                staffId: PrefObj.preferences!.get(PrefKeys.STAFFID).toString(),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            color: AppColor.appColor,
                          ),
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
                          child: AppText(
                            'here',
                            fontWeight: FontWeight.w500,
                            color: AppColor.whiteColor,
                            size: 14.0,
                          ),
                        ),
                      ):Container(),
                    ],
                  ),
                )

              ],
            );
          }
        });
  }

  Widget serviceDetailsText() {
    return AppText(
      'Service Details',
      color: AppColor.appColor,
      size: 18.0,
      fontWeight: FontWeight.w600,
    );
  }
}

List<Widget> extraPackageServiceList(
    List<PackageServices> selectedExtraServiceData) {
  List<Widget> widgets = [];
  for (PackageServices serviceData in selectedExtraServiceData!) {
    widgets.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            serviceData!.serviceName.toString(),
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            )),
          ),
        ],
      ),
    );
  }
  return widgets;



}
double parseAmount(dynamic dAmount){

  double returnAmount = 0.00;
  String strAmount;

  try {

    if (dAmount == null || dAmount == 0) return 0.0;

    strAmount = dAmount.toString();

    if (strAmount.contains('.')) {
      returnAmount = double.parse(strAmount);
    }else{
      returnAmount = double.parse(strAmount);
      // Didn't need else since the input was either 0, an integer or a double
    }
  } catch (e) {
    return 0.0;
  }

  return returnAmount;
}