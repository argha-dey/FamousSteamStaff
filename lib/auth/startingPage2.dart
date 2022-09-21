import 'dart:convert';

import 'package:famous_steam_staff/bottombar/bottombar.dart';
import 'package:famous_steam_staff/common/widgets.dart';
import 'package:famous_steam_staff/global/global.dart';
import 'package:famous_steam_staff/global/prefskey.dart';
import 'package:famous_steam_staff/model/login_model.dart';
import 'package:famous_steam_staff/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../common/text.dart';
import '../global/color.dart';
import '../model/forgot_password_model.dart';

class StartingScreen2 extends StatefulWidget {
  const StartingScreen2({Key? key}) : super(key: key);

  @override
  State<StartingScreen2> createState() => _StartingScreen2State();
}

class _StartingScreen2State extends State<StartingScreen2> {
  TextEditingController userId = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final repository = Repository();
  static const Color appColor = Color(0xff004471);

  FocusNode emailNodes = FocusNode();
  FocusNode passwordNodes = FocusNode();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        backgroundColor: AppColor.lightrgrey,
        body:   SingleChildScrollView (
          child: Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 19.0,
                right: 19.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/package_image.png',
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 60.h),
                  CTextField(
                    maxTextLength:9,
                    focusNode: emailNodes,
                    controller: userId,
                    hintText: 'User Mobile No.',
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(passwordNodes);
                    },
                  ),
                  SizedBox(height: 30.h),
                  CTextField(
                    focusNode: passwordNodes,
                    controller: password,
                    hintText: 'Password',
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(emailNodes);
                    },
                  ),
                  SizedBox(height: 50.h),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if(userId.text.isEmpty && password.text.isEmpty){
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Please fill the credentials",
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
                                      /*   Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StartingScreen2(),
                        ));*/

                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      else if(userId.text.isEmpty ){
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Please enter mobile number",
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
                                      /*   Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StartingScreen2(),
                        ));*/

                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      else if( userId.text.length < 9){
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Mobile Number must be of 9 digit",
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
                                      /*   Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StartingScreen2(),
                        ));*/

                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      else if(password.text.isEmpty ){
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Please enter password",
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
                                      /*   Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StartingScreen2(),
                        ));*/

                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      else  if ( password.text.length < 6) {

                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                " Password cannot be less than 6 characters",
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
                                      /*   Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StartingScreen2(),
                        ));*/

                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }

                      _validateInputs();
                      if (userId.text.length == 9 && password.text.length >= 6) {
                        onLoginAPI();
                      }

                    },
                    child: Container(
                      height: 44.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        gradient: const LinearGradient(
                          begin: Alignment(0.0, -0.95),
                          end: Alignment(0.0, 1.0),
                          colors: [
                            Colors.white,
                            Color(0xff0484E0),
                          ],
                          stops: [0.0, 1.0],
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Login',
                        style: GoogleFonts.montserrat(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff004471),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  /*  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return  Dialog(
                                  insetPadding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 20.h),
                                  child: Container(
                                    height: 200,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 15.w,
                                          right: 15.w,
                                          top: 8.h,
                                          bottom: 8.h),
                                      child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 10.w),
                                            AppText(
                                              'Put your mobile no.',
                                              color: AppColor.black,
                                              fontWeight: FontWeight.w500,
                                              size: 14.sp,
                                            ),
                                            SizedBox(height: 10.w),
                                            TextFormField(
                                              textInputAction:
                                              TextInputAction.next,
                                              keyboardType:
                                              TextInputType.number,
                                              //     validator: validateoldPassword,
                                              //    focusNode: oldpasswordNodes,
                                              controller: mobileNo,
                                              decoration: InputDecoration(
                                                  border:
                                                  const OutlineInputBorder(),
                                                  labelText:
                                                  'Enter your mobile number',
                                                  labelStyle: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: AppColor
                                                          .lightButtonColor)),
                                            ),
                                            SizedBox(height: 20.w),
                                            GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .requestFocus(FocusNode());

                                                onForgotPasswordAPI();
                                              },
                                              child:    Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(10.w),
                                                decoration: BoxDecoration(
                                                  color: AppColor.appColor,
                                                  borderRadius:
                                                  BorderRadius.circular(3.w),
                                                ),
                                                child: AppText(
                                                  'Submit',
                                                  textCenter: true,
                                                  color: AppColor.whiteColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                  )

                              );
                            });
                      },
                      child: Container(
                        height: 44.h,
                        alignment: Alignment.center,
                        child: Text(
                          'Forgot Password',
                          style: GoogleFonts.montserrat(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),*/
                ],
              ),
            ),
          ),
        ),
        )
    );
  }

  //================================ Check Validation ============================//

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  //================================ Mobile TextFild Validation ============================//

 dynamic validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Your Mobile Number';
    } else if (value.length < 9) {

      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Mobile Number must be of 9 digit",
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
                    /*   Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StartingScreen2(),
                        ));*/

                  },
                ),
              ),
            ],
          );
        },
      );
    }
    /*  else if (isLogin.message != "Login Successfully") {
      return 'mobile number not match';
    }*/

    return null;
  }

  // //================================ Email TextFild Validation ============================//

  // String? validateEmail(String? value) {
  //   String pattern =
  //       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  //   RegExp regex = RegExp(pattern);
  //   if (!regex.hasMatch(value!)) {
  //     return 'Please Enter a Valid Email Address';
  //   } else {
  //     return null;
  //   }
  // }

  //================================ Password TextFild Validation ============================//
  String? validatePassword(String? value,) {
    if (value!.isEmpty) {
      return 'Please Enter Password';
    } else if (value.length < 6) {
      return 'Password cannot be less than 6 characters ';
    }
/*  else if (isLogin.message != "Login Successfully") {
      return 'password not match';
    }*/
    else {
      return null;
    }
  }

  dynamic onForgotPasswordAPI() async {
    // show loader
    Loader().showLoader(context);
    final ForgotPasswordModel mobile =
    await repository.onForgotPassword(int.parse(mobileNo.text));
    if (mobile.message == "Reset password sent on your mobile.") {
      FocusScope.of(context).requestFocus(FocusNode());
      // PrefObj.preferences!.put(PrefKeys.TOKEN, islog    in.accessToken);
      //  print(PrefObj.preferences!.put(PrefKeys.TOKEN, islogin.accessToken));
      Loader().hideLoader(context);
      showSnackBar(context, mobile.message.toString());
    } else {
      Loader().hideLoader(context);
      showSnackBar(context, "Sorry,try again later");
    }
  }



  dynamic onLoginAPI() async {
    // show loader
   Loader().showLoader(context);
    final  http.Response  response = await repository.onlogin(userId.text, password.text);
    Map<String, dynamic> map = json.decode(response.body);
    var loginMsg =  map["message"];
    if (loginMsg == "Login Successfully") {
      LoginModel  loginModel =  LoginModel.fromJson(jsonDecode(response.body));
      FocusScope.of(context).requestFocus(FocusNode());
      PrefObj.preferences!.put(PrefKeys.TOKEN,loginModel.accessToken);
      PrefObj.preferences!.put(PrefKeys.LANG,"eng");
      print(PrefObj.preferences!.put(PrefKeys.TOKEN,loginModel.accessToken));
      Loader().hideLoader(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomBarpage(pageIndex: 1,),
          ));
    }
    else {
      Loader().hideLoader(context);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              loginMsg,
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
                 /*   Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StartingScreen2(),
                        ));*/

                  },
                ),
              ),
            ],
          );
        },
      );
    }
  }
}
