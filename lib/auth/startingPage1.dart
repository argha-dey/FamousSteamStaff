import 'package:famous_steam_staff/auth/startingPage2.dart';
import 'package:famous_steam_staff/bottombar/bottombar.dart';
import 'package:famous_steam_staff/global/prefskey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/carwash2.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Image.asset(
                    'assets/images/next_arrow.png',
                    height: 90.h,
                    width: 90.w,
                  ),
                  onTap: () {
                    bool islogin =
                        PrefObj.preferences!.containsKey(PrefKeys.TOKEN)
                            ? true
                            : false;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => islogin
                            ? const BottomBarpage(pageIndex: 0,)
                            : const StartingScreen2(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
