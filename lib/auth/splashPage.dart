import 'dart:async';
import 'package:famous_steam_staff/auth/startingPage1.dart';
import 'package:famous_steam_staff/auth/startingPage2.dart';
import 'package:famous_steam_staff/global/color.dart';
import 'package:famous_steam_staff/global/prefskey.dart';
import 'package:flutter/material.dart';

import '../bottombar/bottombar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const Color appColor = Color(0xff004471);
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), navigateUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightrgrey,
      body: Center(
        child:SizedBox(
          width: double.infinity,
          child: Image.asset(
            'assets/images/package_image.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void navigateUser() {
/*    PrefObj.preferences!.containsKey(PrefKeys.TOKEN) ? true : false;
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const StartingScreen()));*/
    bool islogin =
    PrefObj.preferences!.containsKey(PrefKeys.TOKEN)
        ? true
        : false;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => islogin
            ? const BottomBarpage(pageIndex: 1,)
            : const StartingScreen2(),
      ),
    );

  }
}
