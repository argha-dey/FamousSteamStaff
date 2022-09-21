/*import 'package:dotted_line/dotted_line.dart';
import 'package:famous_steam_staff/bloc/servicedetail_bloc.dart';
import 'package:famous_steam_staff/common/custom_appbar.dart';
import 'package:famous_steam_staff/common/text.dart';
import 'package:famous_steam_staff/global/color.dart';
import 'package:famous_steam_staff/model/servicedetail_model.dart';
import 'package:flutter/material.dart';
import 'steper_service_details.dart';

class WaitingServiceDetails extends StatefulWidget {
  WaitingServiceDetails({Key? key, this.id}) : super(key: key);
  String? id;

  @override
  State<WaitingServiceDetails> createState() => _WaitingServiceDetailsState();
}

class _WaitingServiceDetailsState extends State<WaitingServiceDetails> {
  @override
  void initState() {
    super.initState();
    servicedetailbloc.servicedetailstreamsink(widget.id!, 'eng');
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
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 19.0,
            top: 19.0,
            right: 19.0,
          ),
          child: Column(
            children: [
              const SizedBox(height: 22.0),
              serviceDetailsText(),
              const SizedBox(height: 35.0),
              serviceDetails(),
              const SizedBox(height: 35.0),
            ],
          ),
        ),
      ),
    );
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
          return Container(
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
                      serviceDetailssnapshot
                              .data!.waitingServices!.orderstatus ??
                          '',
                      color: serviceDetailssnapshot
                                      .data!.waitingServices!.orderstatus !=
                                  null &&
                              serviceDetailssnapshot
                                  .data!.waitingServices!.orderstatus!
                                  .contains('Waiting')
                          ? AppColor.yellow
                          : AppColor.green,
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
                      'Serice No',
                      color: AppColor.black,
                    ),
                    AppText(
                      '# ${serviceDetailssnapshot.data!.waitingServices!.serviceNo}',
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
                      'SAR ${serviceDetailssnapshot.data!.waitingServices!.serviceValue}.00',
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
                          .data!.waitingServices!.serviceType!,
                      color: AppColor.black,
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      'Serice Name',
                      color: AppColor.black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppText(
                      serviceDetailssnapshot
                          .data!.waitingServices!.serviceName!,
                      color: AppColor.black,
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
                  'Slot',
                  color: AppColor.black,
                ),
                const SizedBox(height: 11.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText(
                      '${serviceDetailssnapshot.data!.waitingServices!.slotDate} ,',
                      color: AppColor.black,
                      fontWeight: FontWeight.w300,
                    ),
                    AppText(
                      '${serviceDetailssnapshot.data!.waitingServices!.slotStartTime}AM - ${serviceDetailssnapshot.data!.waitingServices!.slotEndTime}PM',
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
                  serviceDetailssnapshot.data!.waitingServices!.vehicleBrand!,
                  color: AppColor.black,
                  fontWeight: FontWeight.w300,
                ),
                AppText(
                  serviceDetailssnapshot.data!.waitingServices!.vehicleSize!,
                  color: AppColor.black,
                  fontWeight: FontWeight.w300,
                ),
                AppText(
                  serviceDetailssnapshot.data!.waitingServices!.vehicleType!,
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
                  serviceDetailssnapshot.data!.waitingServices!.address!,
                  color: AppColor.black,
                  fontWeight: FontWeight.w300,
                ),
                const SizedBox(height: 11.0),
              ],
            ),
          );
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
}*/
