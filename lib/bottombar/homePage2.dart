import 'package:dotted_line/dotted_line.dart';
import 'package:famous_steam_staff/bloc/dhasboard_bloc.dart';
import 'package:famous_steam_staff/bloc/getrating_bloc.dart';
import 'package:famous_steam_staff/bottombar/view_page.dart';

import 'package:famous_steam_staff/common/custom_appbar.dart';
import 'package:famous_steam_staff/global/global.dart';
import 'package:famous_steam_staff/localizations/app_localizations.dart';
import 'package:famous_steam_staff/localizations/language_model.dart';
import 'package:famous_steam_staff/model/accept_reject_model.dart';
import 'package:famous_steam_staff/model/dashboard_model.dart';
import 'package:famous_steam_staff/model/getrating_model.dart';
import 'package:famous_steam_staff/model/waiting_list_model.dart';
import 'package:famous_steam_staff/repository/repository.dart';
import 'package:famous_steam_staff/sevicedetails/orderDetails.dart';
import 'package:famous_steam_staff/sevicedetails/waiting_service_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global/color.dart';

class Home2Screen extends StatefulWidget {
  const Home2Screen({Key? key}) : super(key: key);//

  @override
  State<Home2Screen> createState() => _Home2ScreenState();
}

class _Home2ScreenState extends State<Home2Screen> {
  LangModel? languageModel;
  final repository = Repository();
  @override
  void initState() {
    super.initState();

    dashboardBloc.dashboardBlocSink();
 //   getratingbloc.getratingstreamsink();
  //  waitingListBloc.waitinglistBlocSink();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(55), child: WidgetAppBar()),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 19.0,
              top: 19.0,
              right: 19.0,
            ),
            child: StreamBuilder<DashboardModel>(
              stream: dashboardBloc.dashboardStream,
              builder:
                  (context, AsyncSnapshot<DashboardModel> dashboardsnapshot) {
                if (!dashboardsnapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator()
                    //Text("No data found",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18),),
                  );
                }
                return dashboardsnapshot.data!.exception!=null?
                Container(
                  child: Center(
                    child:Text(
                      'No Data Available!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 12.0,
                        color: const Color(0xff000088),
                        fontWeight: FontWeight.w600,
                      ),
                    )
                ),):Column(
                  children: [
                    SizedBox(height: 10.h),
                    progressCard(dashboardsnapshot),
                    const SizedBox(height: 40.0),
                    serviceCard(dashboardsnapshot),
                    const SizedBox(height: 40.0),
                    waitingServicesCard(dashboardsnapshot),
                    const SizedBox(height: 40.0),
           /*         customerRating(),
                    const SizedBox(height: 40.0),*/
                  ],


                );
              },
            ),
          ),
        ),
       
      ),
    );
  }

  Widget progressCard(AsyncSnapshot<DashboardModel> dashboardsnapshot) {
    return Container(
      height: 140.0,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0.0, 0.0),
            blurRadius: 8.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100.0,
            width: 100.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/progress.png'),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              '${dashboardsnapshot.data!.todayCompletedServicePercentage}%'+"\n"+Translation.of(context)!.translate('complate')!,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 12.0,
                color: const Color(0xff000088),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'SAR ${dashboardsnapshot.data!.todayTotalServiceAmount.toString()}',
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0,
                      color: const Color(0xff004471),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    Translation.of(context)!.translate('todaysservicevalue')!,

                    style: GoogleFonts.montserrat(
                      fontSize: 12.0,
                      color: const Color(0xff004471),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'SAR ${dashboardsnapshot.data!.todayCompletedServiceAmount
                  .toString()}'

                    ,
                    style: GoogleFonts.montserrat(
                      fontSize: 15.0,
                      color: const Color(0xff004471),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    Translation.of(context)!
                        .translate('todaysservicecomplete')
                        .toString(),
                    style: GoogleFonts.montserrat(
                        fontSize: 12.0, color: const Color(0xff004471)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget serviceCard(AsyncSnapshot<DashboardModel> dashboardsnapshot) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 13.0,
              vertical: 17.0,
            ),
            decoration: BoxDecoration(
              color: const Color(0xff000088),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Translation.of(context)!.translate('today')!,
                      style: GoogleFonts.montserrat(
                          fontSize: 11.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 2.0),
                    Text.rich(
                      TextSpan(
                        text: dashboardsnapshot
                            .data!.todayAcceptService
                            .toString(),
                        style: GoogleFonts.montserrat(
                          fontSize: 21.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                       
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                     Translation.of(context)!.translate('Service').toString()+"\n"+
                        Translation.of(context)!.translate('Accepted')!,
                      textAlign: TextAlign.end,
                      style: GoogleFonts.montserrat(
                        fontSize: 12.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 18.0),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 13.0,
              vertical: 17.0,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffFF9529),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Translation.of(context)!.translate('today')!,
                      style: GoogleFonts.montserrat(
                        fontSize: 11.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text.rich(
                      TextSpan(
                        text: dashboardsnapshot
                            .data!.todayRejectService
                            .toString(),
                        style: GoogleFonts.montserrat(
                          fontSize: 21.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                     
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Translation.of(context)!.translate('Service').toString()+"\n"+
              Translation.of(context)!.translate('Rejected')!,
                      textAlign: TextAlign.end,
                      style: GoogleFonts.montserrat(
                        fontSize: 12.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget waitingServicesCard(AsyncSnapshot<DashboardModel> dashboardsnapshot) {
    return Container(
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 13.0,
              vertical: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Translation.of(context)!.translate('waitingservices')!,
                  style: GoogleFonts.montserrat(
                    fontSize: 14.0,
                    color: const Color(0xff004471),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
               /*   'Total ${dashboardsnapshot.data!.todayTotalServiceAmount}'*/'',
                  style: GoogleFonts.montserrat(
                    fontSize: 14.0,
                    color: const Color(0xff004471),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 0.0,
            color: Color(0xffC4C4C4),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 13.0,
              vertical: 19.0,
            ),
            child: Column(
              children: [
                servicesListtile(dashboardsnapshot),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget servicesListtile(AsyncSnapshot<DashboardModel> dashboardsnapshot) {
    return dashboardsnapshot.data!.orders!.isEmpty
        ? Center(
            child: Text(
            Translation.of(context)!.translate('noordersfound')!,
            style: GoogleFonts.montserrat(
              fontSize: 15.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ))
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: dashboardsnapshot.data!.orders!.length,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '# ${dashboardsnapshot.data!.orders![index].orderDisplayId}',
                      style: GoogleFonts.montserrat(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewScreen(
                                        id: dashboardsnapshot.data!
                                            .orders![index].orderId.toString(),status: dashboardsnapshot.data!.orders![index].orderStatus.toString()
                                      ,statusColor: dashboardsnapshot.data!.orders![index].orderStatus ==
                                        'Accepted'
                                        ? AppColor.green
                                        : AppColor.yellow,)));
                          },
                          child: Text(
                            Translation.of(context)!.translate('view')!,
                            style: GoogleFonts.montserrat(
                              fontSize: 13.0,
                              color: const Color(0xff2f2f2f),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7.0,
                          ),
                          child: Text('|'),
                        ),
                        GestureDetector(
                          onTap: () {
                            onacceptAPI(dashboardsnapshot
                                .data!.orders![index].orderId.toString());
                          },
                          child: Text(
                            Translation.of(context)!.translate('accept')!,
                            style: GoogleFonts.montserrat(
                              fontSize: 13.0,
                              color: const Color(0xff128807),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7.0,
                          ),
                          child: Text('|'),
                        ),
                        GestureDetector(
                          onTap: () {
                            onrejectAPI(dashboardsnapshot
                                .data!.orders![index].orderId.toString());
                          },
                          child: Text(
                            Translation.of(context)!.translate('reject')!,
                            style: GoogleFonts.montserrat(
                              fontSize: 13.0,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Text(
                  Translation.of(context)!.translate('acceptwithin20mins')!,
                  style: GoogleFonts.montserrat(
                    fontSize: 11.0,
                    color: const Color(0xff004471),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 17.0),
                  child: DottedLine(
                    direction: Axis.horizontal,
                    lineLength: double.infinity,
                    dashLength: 2.0,
                    dashGapLength: 1.0,
                    dashColor: const Color(0xff004471).withOpacity(0.84),
                  ),
                ),
              ],
            ),
          );
  }

/*  Widget customerRating() {
    return StreamBuilder<GetratingModel>(
        stream: getratingbloc.getratingstream,
        builder: (context, AsyncSnapshot<GetratingModel> getratingsnapshot) {
          if (!getratingsnapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return getratingsnapshot.data!.ratingCount!.isEmpty
              ? Center(
                  child: Text(
                  Translation.of(context)!.translate('nodatafound')!,
                  style: GoogleFonts.montserrat(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ))
              : Container(
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Customer\nRating',
                            style: GoogleFonts.montserrat(
                              fontSize: 14.0,
                              color: const Color(0xff004471),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/fill_star.png',
                                height: 17.0,
                                width: 17.0,
                              ),
                              const SizedBox(width: 1.5),
                              Image.asset(
                                'assets/images/fill_star.png',
                                height: 17.0,
                                width: 17.0,
                              ),
                              const SizedBox(width: 1.5),
                              Image.asset(
                                'assets/images/fill_star.png',
                                height: 17.0,
                                width: 17.0,
                              ),
                              const SizedBox(width: 1.5),
                              Image.asset(
                                'assets/images/fill_star.png',
                                height: 17.0,
                                width: 17.0,
                              ),
                              const SizedBox(width: 1.5),
                              Image.asset(
                                'assets/images/star.png',
                                height: 17.0,
                                width: 17.0,
                                color: const Color(0xffFF9529),
                              ),
                            ],
                          ),
                          Text.rich(
                            TextSpan(
                              text: getratingsnapshot.data!.ratingCount,
                              style: GoogleFonts.montserrat(
                                fontSize: 21.0,
                                color: const Color(0xff004471),
                                fontWeight: FontWeight.w500,
                              ),
                           
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
        });
  }*/

  // enum('pending', 'approve', 'decline', 'complete')  for order status

  dynamic onacceptAPI(String? id) async {
    Loader().showLoader(context);
    final AcceptRejectModel isacceptreject =
        await repository.onacceptReject(id!, "approve");
    if (true) {
      FocusScope.of(context).requestFocus(FocusNode());
      dashboardBloc.dashboardBlocSink();
      Loader().hideLoader(context);
      showSnackBar(context, isacceptreject.message.toString());
    } else {
      Loader().hideLoader(context);
    }
  }


  dynamic onrejectAPI(String? id) async {
    Loader().showLoader(context);
    final AcceptRejectModel isacceptreject =
        await repository.onacceptReject(id!, "decline");
    if (true) {
      FocusScope.of(context).requestFocus(FocusNode());
      dashboardBloc.dashboardBlocSink();
      Loader().hideLoader(context);
      showSnackBar(context, isacceptreject.message.toString());
    } else {
      Loader().hideLoader(context);
    }
  }
}
