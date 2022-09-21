import 'package:famous_steam_staff/bloc/get_staff_bloc.dart';
import 'package:famous_steam_staff/common/text.dart';
import 'package:famous_steam_staff/global/color.dart';
import 'package:famous_steam_staff/model/get_staff_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../global/prefskey.dart';

class WidgetAppBar extends StatefulWidget {
  final String? subtitle;
  final String? title;
  final double? height;
  void Function()? onTap;
  final IconData? menuItem;
  WidgetAppBar({
    Key? key,
    this.subtitle,
    this.title = '',
    this.menuItem,
    this.onTap,
    this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  State<WidgetAppBar> createState() => _WidgetAppBarState();
}

String name = '';
String mobile = '';
class _WidgetAppBarState extends State<WidgetAppBar> {
  @override
  void initState() {
    getstaffBloc.getstaffBlocSink();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GetstaffModel>(
        stream: getstaffBloc.getstaffStream,
        builder: (context, AsyncSnapshot<GetstaffModel> getstaffsnapshot) {
          if (!getstaffsnapshot.hasData) {
            return Center(
              child: AppBar(
                leading: const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      "assets/images/avtar.jpg",
                    ),

                    radius: 30.0,
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.only(
                          left: 10, right: 5, bottom: 10, top: 10),
                      child: Icon(
                        widget.menuItem,
                        size: 28.h,
                        color: AppColor.appColor,
                      ),
                    ),
                  )
                ],
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      name,
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 4.h),
                    AppText(
                      mobile,
                      size: 11.0,
                      color: AppColor.lightButtonColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                leadingWidth: 60,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            );
          }
          name = getstaffsnapshot.data!.data!.name!;
          mobile = getstaffsnapshot.data!.data!.mobile!;
          PrefObj.preferences!.put(PrefKeys.STAFFID, getstaffsnapshot.data!.data!.staffId);
         // print("STAFFID =>"+PrefObj.preferences!.get(PrefKeys.STAFFID).toString());

          return AppBar(
            leading: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://carwash.tenderguru.in/uploads/profile/5245972811651131569.jpg",
                ),
                radius: 30.0,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.only(
                      left: 10, right: 5, bottom: 10, top: 10),
                  child: Icon(
                    widget.menuItem,
                    size: 28.h,
                    color: AppColor.appColor,
                  ),
                ),
              )
            ],
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  getstaffsnapshot.data!.data!.name!,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 4.h),
                AppText(
                  getstaffsnapshot.data!.data!.mobile!,
                  size: 11.0,
                  color: AppColor.lightButtonColor,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            leadingWidth: 60,
            backgroundColor: Colors.transparent,
            elevation: 0,
          );
        });
  }
}
