import 'dart:async';
import 'dart:io';

import 'package:dotted_line/dotted_line.dart';
import 'package:famous_steam_staff/bloc/get_status_bloc.dart';
import 'package:famous_steam_staff/bloc/servicedetail_bloc.dart';
import 'package:famous_steam_staff/common/custom_appbar.dart';
import 'package:famous_steam_staff/common/text.dart';
import 'package:famous_steam_staff/global/color.dart';
import 'package:famous_steam_staff/global/global.dart';

import 'package:famous_steam_staff/model/status_complete_model.dart';
import 'package:famous_steam_staff/repository/repository.dart';
import 'package:famous_steam_staff/sevicedetails/google_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/get_status_model.dart';
import 'orderList.dart';

class SteperServiceDetails extends StatefulWidget {
  SteperServiceDetails(
      this.orderid, this.staffStatus, this.latitude, this.longitude, this.status,
       this.statusColor,this.phone,
      {Key? key})
      : super(key: key);
  String orderid;
  String staffStatus;
  var latitude;
  var longitude;
  String status;
  Color statusColor;
  String phone;
  @override
  State<SteperServiceDetails> createState() => _SteperServiceDetailsState();
}

class _SteperServiceDetailsState extends State<SteperServiceDetails> {
  int _activeCurrentStep = 0;
  String flag = "0";

  TextEditingController orderid = TextEditingController();
  TextEditingController status_id = TextEditingController();
  bool details = false;
  bool isstarted = true;
  int index = 0;
  String snapshottt = '';
  // String statusid = '';
  final repository = Repository();

  bool isCameFromBackPage = true;

  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  List<Step> createStepListUsers(List<StepData>? data) {
    List<Step> widgets = [];

    for (StepData userStaffData in data!) {
      //@
      if(userStaffData.staffOrderStatusId! <=_activeCurrentStep){
        flag ='1';
      }else{
        flag ='0';
      }


      widgets.add(Step(
          title: Row(
            children: [
              Expanded(
                flex: 1,
                child: buttonService(userStaffData.image!,true ,false), // bottom color change
              ),
              Expanded(
                flex: 3,
                child: AppText(userStaffData.updateButton.toString(),
                    fontWeight: FontWeight.w500,
                    color: flag == "1"
                        ? AppColor.green
                        : AppColor.buttongreycolor),
              ),
            ],
          ),
          state: flag == "1" ? StepState.complete : StepState.disabled,
          isActive: snapshottt == '',
          content: Container(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
                onPressed: () {
                  if (_activeCurrentStep <= (users!.length - 1)) {
                    setState(() {
                      snapshottt += '1';
                      statusComplete(userStaffData.staffOrderStatusId.toString());
                    });
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF004471))),
                child: AppText(
                  userStaffData.updateButton.toString(),
                  fontWeight: FontWeight.w400,
                  color: AppColor.whiteColor,
                )),
          )));
    }

    return widgets;
  }

  late List<StepData> data = <StepData>[];
  @override
  void initState() {
    super.initState();

    if(widget.staffStatus=='0'){
      _activeCurrentStep = 0;
    }else{
      _activeCurrentStep = int.parse(widget.staffStatus.toString());

    }


    getStatusBloc.getStatusBlocSink('eng', widget.orderid);

    // servicedetailbloc.servicedetailstreamsink('9', 'eng');
    //   currentStaffState =  int.parse(widget.staffStatus != null ? widget.staffStatus : "0");
  }

  List<StepData>? users;
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
        body: Theme(
          data: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: AppColor.green, surface: AppColor.buttongreycolor),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // SizedBox(height: 20.h),
                Center(
                    child:
                        AppText('', fontWeight: FontWeight.w500, size: 18.sp)),
                SizedBox(height: 15.h),
                Visibility(
                  visible: isstarted,
                  child: StreamBuilder<GetStatusModel>(
                      stream: getStatusBloc.getStatusStream,
                      builder:
                          (context, AsyncSnapshot<GetStatusModel> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        users = snapshot.data!.data!;

                        print("_activeCurrentStep>>" + _activeCurrentStep.toString());


                        return Container(
                          margin: EdgeInsets.only(left: 15.w, right: 15.w),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: AppColor.greyColor,
                                    blurRadius: 0.2,
                                    spreadRadius: 4)
                              ]),
                          child: Column(
                            children: [
                              startedStatus(),
                              Stepper(
                                controlsBuilder: (context, _) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      SizedBox(),
                                      SizedBox(),
                                    ],
                                  );
                                },
                                steps: createStepListUsers(snapshot.data!.data),
                                physics: const ScrollPhysics(),
                                currentStep: _activeCurrentStep,   // Current Step
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(height: isstarted ? 20.h : 0.h),

                Padding(
                  padding: EdgeInsets.only(left: 40.w, right: 40.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            print("@current lat==>" + widget.latitude);

                            if (widget.latitude == null) {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Center(
                                        child: Text(
                                          "No latitude & longitude found",
                                          style: GoogleFonts.montserrat(
                                              textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff128807))),
                                        ),
                                      ),
                                      actions: <Widget>[
                                        Center(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: AppColor.appColor,
                                              onPrimary: AppColor.appColor,
                                            ),
                                            child: Text(
                                              'OK',
                                              style: GoogleFonts.montserrat(
                                                  textStyle: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          AppColor.whiteColor)),
                                            ),
                                            onPressed: () {


                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 100,
                                        ),
                                      ],
                                    );
                                  });
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MapData(
                                          widget.orderid,
                                          widget.latitude,
                                          widget.longitude)));
                            }
                          },
                          child: buttons('assets/images/map_marker.png')),
                      GestureDetector(
                          onTap: () {
                            // ignore: deprecated_member_use
                            launch("tel://${widget.phone}");
                            child:
                            const Text("Call me");
                          },
                          child: buttons('assets/images/phone.png')),
                      GestureDetector(
                          onTap: () {
                            whatsAppOpen("${widget.phone}");
                          },
                          child: buttons('assets/images/whatsapp.png')),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                isstarted ? Container() : Container(),
              ],
            ),
          ),
        ));
  }

  void googlemap() async {
    GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: const CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
    );
  }

  void whatsAppOpen(String number) async {
    var whatsapp = number;
    var whatsappURlAndroid = "whatsapp://send?phone=" + whatsapp + "&text=";
    var whatsappWebLangingpage = "https://www.whatsapp.com";
    var whatsappURLIos = "https://wa.me/$whatsapp?text=${Uri.parse("")}";
    if (Platform.isIOS) {
      await launch(whatsappURLIos, forceSafariVC: false);
    } else if (Platform.isAndroid) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      await launch(whatsappURlAndroid);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      await launch(whatsappWebLangingpage, forceSafariVC: false);
    }
  }

  Widget startedStatus() {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w),
      child: Column(
        children: [
          SizedBox(height: 15.h),
          Row(
            children: [
              AppText('Status', fontWeight: FontWeight.w500),
              const Spacer(),

            ],
          ),
          SizedBox(height: 15.h),
          const DottedLine(
              dashGapLength: 3, dashColor: AppColor.lightButtonColor),
        ],
      ),
    );
  }

  Widget profileDetails() {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage(
            'assets/images/profilepicture.png',
          ),
          radius: 20.0,
        ),
        SizedBox(width: 18.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText('Lorem Ipsum',
                color: AppColor.lightButtonColor, fontWeight: FontWeight.w500),
            SizedBox(height: 4.h),
            AppText('#L12335566M',
                size: 11.0,
                color: AppColor.lightButtonColor,
                fontWeight: FontWeight.w400)
          ],
        ),
      ],
    );
  }

  Widget buttons(String images) {
    return Visibility(
      visible: isstarted,
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: AppColor.whiteColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 0.3, spreadRadius: 0.4)
              ],
              shape: BoxShape.circle),
          child: Image.asset(images, height: 50.h)),
    );
  }

  Widget buttonService(String images, bool bool, bool bool1) {
    return Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: flag=='1'
                ? AppColor.green
                : flag=='0'
                    ? AppColor.appColor
                    : AppColor.buttongreycolor,
            shape: BoxShape.circle),
        child: Image.network(images, height: 20.h));
/*    child: Image.asset(
      'assets/images/btn_home.png',
        height: 20.h,
    ) );*/
  }

/*  Widget serviceDetails() {
    return StreamBuilder<ServicedetailModel>(
        stream: servicedetailbloc.servicedetailstream,
        builder: (context,
            AsyncSnapshot<ServicedetailModel> serviceDetailssnapshot) {
          if (!serviceDetailssnapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Visibility(
            visible: details,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
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
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          'Serice No',
                          color: AppColor.black,
                        ),
                        AppText(
                          '# ${    serviceDetailssnapshot
                              .data!.data!.orderId.toString()}',
                          color: AppColor.black,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          'Service Value',
                          color: AppColor.black,
                        ),
                        AppText(
                          'SAR ${serviceDetailssnapshot.data!.data!.totalAmount}.00',
                          color: AppColor.black,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          'Service Type',
                          color: AppColor.black,
                        ),
                        AppText(
                          serviceDetailssnapshot
                              .data!.data!.package!.packageName.toString(),
                          color: AppColor.black,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          'Service Name',
                          color: AppColor.black,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        serviceDetailssnapshot.data!.data!.extraService!.isNotEmpty?Column(

                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: extraPackageServiceList(serviceDetailssnapshot.data!.data!.extraService!),
                        ):Text("No Extra Service Added", style: GoogleFonts.montserrat(
                            textStyle: TextStyle( color: AppColor.appColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14)),),
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
                      'Slot',
                      color: AppColor.black,
                    ),
                    const SizedBox(height: 11.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AppText(
                          '${ serviceDetailssnapshot.data!.data!.appointmentDate},',
                          color: AppColor.black,
                          fontWeight: FontWeight.w300,
                        ),
                        AppText(
                          '${serviceDetailssnapshot.data!.data!.slotStartTime}AM - ${serviceDetailssnapshot.data!.data!.slotEndTime}PM',
                          size: 12.0,
                          color: AppColor.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    AppText(
                      'Car Details',
                      color: AppColor.black,
                    ),
                    const SizedBox(height: 11.0),
                    AppText(
                      serviceDetailssnapshot.data!.data!.brand!.name
                          .toString(),
                      color: AppColor.black,
                      fontWeight: FontWeight.w300,
                    ),
                    AppText(
                      serviceDetailssnapshot.data!.data!.carSize
                          .toString(),
                      color: AppColor.black,

                      fontWeight: FontWeight.w300,
                    ),
                    AppText(
                      serviceDetailssnapshot.data!.data!.carModel
                          .toString(),
                      color: AppColor.black,
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(height: 16.0),
                    AppText(
                      'Location',
                      color: AppColor.black,
                    ),
                    const SizedBox(height: 11.0),
                    AppText(
                      serviceDetailssnapshot.data!.data!.pickupAddress
                          .toString(),
                      color: AppColor.black,
                      fontWeight: FontWeight.w300,
                    ),
                    SizedBox(height: 20.h)
                  ],
                ),
              ),
            ),
          );
        });
  }*/

  void showpopDialog(BuildContext context, String title, String statusid) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
              child: AppText(
            title,
            color: AppColor.green,
          )),
          actions: <Widget>[
            Center(
              child: TextButton(
                child: AppText(
                  'OK',
                  color: AppColor.appColor,
                  fontWeight: FontWeight.w500,
                ),
                onPressed: () {
                  isstarted = false;
                  Navigator.of(context).pop();
                  details = true;
                  servicedetailbloc.servicedetailstreamsink(statusid, 'eng');
                  setState(() {});
                },
              ),
            ),
          ],
        );
      },
    );
  }

  OrderStaffStatusFlag(String stuffStatus) {

    if (stuffStatus == "1") {
      flag = "1";
    } else if (stuffStatus == "2") {
      flag = "1";
    } else if (stuffStatus == "3") {
      flag = "1";
    } else if (stuffStatus == "4") {
      flag = "1";
    } else if (stuffStatus == "5") {
      flag = "1";
    } else if (stuffStatus == "6") {
      flag = "1";
    } else if (stuffStatus == "7") {
      flag = "1";
    } else if (stuffStatus == "8") {
      flag = "1";
    } else {
      flag = "0";
    }
  }

  dynamic statusComplete(String statusid) async {
    Loader().showLoader(context);

    final StatusCompleteModel isstatuscomplete =
        await repository.statuscomplete(widget.orderid,
           _activeCurrentStep==7 ? "8" :(_activeCurrentStep+1).toString());
    if (isstatuscomplete.message == 'order update Successfully') {
      FocusScope.of(context).requestFocus(FocusNode());
      Loader().hideLoader(context);

      if (_activeCurrentStep == 7) {
        _activeCurrentStep = 7;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Order  done successfully",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff128807),
                ),
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.appColor,
                      onPrimary: AppColor.appColor,
                    ),
                    child: Text(
                      'OK',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    onPressed: () {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderListScreen()));


                    },
                  ),
                ),
              ],
            );
          },
        );
      }
      else {
       _activeCurrentStep = int.parse(isstatuscomplete.data!.staffStatus.toString());
      //  _activeCurrentStep = _activeCurrentStep + 1;

      print(" show current state ${_activeCurrentStep}");

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Step ${_activeCurrentStep} is done successfully",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xff128807),
              ),
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.appColor,
                    onPrimary: AppColor.appColor,
                  ),
                  child: Text(
                    'OK',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColor.whiteColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    getStatusBloc.getStatusBlocSink('eng', widget.orderid);
                    setState(() {});
                  },
                ),
              ),
            ],
          );
        },
      );
    }
    } else {
      Loader().hideLoader(context);
      showSnackBar(context, isstatuscomplete.message.toString());
    }
  }

/*
  List<Widget> extraPackageServiceList(List<PackageServices> selectedExtraServiceData ) {
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
*/
}
