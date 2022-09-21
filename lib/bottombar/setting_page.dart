import 'package:famous_steam_staff/auth/startingPage2.dart';
import 'package:famous_steam_staff/common/custom_appbar.dart';
import 'package:famous_steam_staff/common/text.dart';
import 'package:famous_steam_staff/global/color.dart';
import 'package:famous_steam_staff/global/global.dart';
import 'package:famous_steam_staff/global/prefskey.dart';
import 'package:famous_steam_staff/localizations/app_localizations.dart';
import 'package:famous_steam_staff/model/change_paswword_model.dart';
import 'package:famous_steam_staff/repository/repository.dart';
import 'package:famous_steam_staff/sevicedetails/review_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoped_model/scoped_model.dart';

import '../bloc/rating_review_list_bloc.dart';
import '../localizations/language_model.dart';
import '../model/customer_rating_model.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String? selectedValue;
  LangModel? languageModel;

  TextEditingController oldpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController newconfirmpassword = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final repository = Repository();

  FocusNode oldpasswordNodes = FocusNode();
  FocusNode newpasswordNodes = FocusNode();
  FocusNode newconfirmpasswordNodes = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(PrefObj.preferences!.get(PrefKeys.LANG)=='eng'){
      selectedValue = 'English';
    }else{
      selectedValue = 'Arabic';
    }

    ratingreviewlistbloc.ratingreviewstreamsink();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: WidgetAppBar(

          ),
        ),
        body: ScopedModelDescendant<LangModel>(builder: (context, child, model) {
          languageModel = model;
          return SingleChildScrollView(
            child:SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 18.w, right: 18.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      topImage(),
                      SizedBox(height: 5.w),
                      acountText(),
                      SizedBox(height: 20.w),
                      customerRating(),
                      SizedBox(height: 5.w),
                      TextButton(
                        child: AppText(
                          Translation.of(context)!.translate('View Reviews')!,
                          color: AppColor.appColor,
                          textStyle: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ReviewPage()));
                        },
                      ),
                      SizedBox(height: 10.w),
                      AppText(
                      Translation.of(context)!.translate('Change Language')!,
                        size: 14.0,
                        color: AppColor.appColor,
                        fontWeight: FontWeight.w500,
                      ),
                      selectLanguage(),
                      //  SizedBox(height: 30.w),
                      //passwordText(),
                      SizedBox(height: 40.w),
                      logoutButton(),
                      SizedBox(height: 30.w),
                    ],
                  ),
                ),
              ),
            ),);


        })


    );
  }

  Widget topImage() {
    return Center(
      child: Image.asset(
        'assets/images/settingmain.png',
        height: 300,
      ),
    );
  }

  Widget acountText() {
    return Center(
      child: AppText(
      Translation.of(context)!.translate('Settings')!,
        color: AppColor.appColor,
        fontWeight: FontWeight.w500,
        size: 18.sp,
      ),
    );
  }

  Widget customerRating() {
    return  StreamBuilder<CustomerRatingModel>(
        stream: ratingreviewlistbloc.ratingreviewstream,
        builder: (context,
            AsyncSnapshot<CustomerRatingModel> ratingreviewlistsnapshot) {
          if (!ratingreviewlistsnapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          {
            return  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                     Translation.of(context)!.translate('Customer Rating')!,
                      size: 14.0,
                      color: AppColor.appColor,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 10,),

                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RatingBarIndicator(
                      itemSize: 20.w,
                      rating: ratingreviewlistsnapshot.data!.total == null? 0.0: parseAmount(ratingreviewlistsnapshot.data!.total!.toStringAsFixed(2)),
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      itemCount: 5,
                      direction: Axis.horizontal,
                    ),
                    Text.rich(
                      TextSpan(
                        text: ratingreviewlistsnapshot.data!.total == null? "0" :ratingreviewlistsnapshot.data!.total!.toStringAsFixed(2),
                        style: GoogleFonts.montserrat(
                          fontSize: 21.0,
                          color: AppColor.appColor,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: '/5',
                            style: GoogleFonts.montserrat(
                              fontSize: 11.0,
                              color: AppColor.appColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        });

  }

  Widget selectLanguage() {
    return DropdownButton<String>(
      focusColor: AppColor.appColor,
      value: selectedValue,
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: AppColor.appColor,
          fontSize: 12.sp,
        ),
      ),
      alignment: Alignment.centerRight,
      iconEnabledColor: Colors.white,
      isExpanded: true,

      dropdownColor: AppColor.whiteColor,
      items: <String>['English', 'Arabic']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          onTap: () {
            selectedValue = value;
            setState(() {});
          },
          value: value,
          child: Text(
            value,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: AppColor.black,
                fontSize: 12.sp,
              ),
            ),
          ),
        );
      }).toList(),
      hint: Text(
        "English",
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: AppColor.black,
            fontSize: 12.sp,
          ),
        ),
      ),

      onChanged: (String? value) {
        setState(() {
          selectedValue = value;
          if (value == 'English') {
            PrefObj.preferences!.put(PrefKeys.LANG, 'eng');
            languageModel!.changeLanguage('en');
          } else {
            PrefObj.preferences!.put(PrefKeys.LANG, 'ar');
            languageModel!.changeLanguage('ar');
          }
        });
      },
    );
  }


  Widget passwordText() {
    return Column(
      children: [
        Row(
          children: [
            AppText(
              'password',
              fontWeight: FontWeight.w500,
              color: AppColor.black,
              size: 14.sp,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppText(
              "Last update 20-01-2022",
              fontWeight: FontWeight.w500,
              color: AppColor.lightButtonColor,
              size: 14.sp,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: Dialog(
                        insetPadding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 150.h),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, top: 8.h, bottom: 8.h),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.w),
                                AppText(
                                  'changeyourpassword',
                                  color: AppColor.black,
                                  fontWeight: FontWeight.w500,
                                  size: 14.sp,
                                ),
                                SizedBox(height: 10.w),
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  validator: validateoldPassword,
                                  focusNode: oldpasswordNodes,
                                  controller: oldpassword,
                                  decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      labelText: 'Enter your current password',
                                      labelStyle: TextStyle(
                                          fontSize: 12.sp,
                                          color: AppColor.lightButtonColor)),
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context)
                                        .requestFocus(newpasswordNodes);
                                  },
                                ),
                                SizedBox(height: 20.w),
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  focusNode: newpasswordNodes,
                                  validator: validatenewPassword,
                                  controller: newpassword,
                                  decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      labelText: 'Enter new passwod',
                                      labelStyle: TextStyle(
                                          fontSize: 12.sp,
                                          color: AppColor.lightButtonColor)),
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context)
                                        .requestFocus(newconfirmpasswordNodes);
                                  },
                                ),
                                SizedBox(height: 20.w),
                                TextFormField(
                                  focusNode: newconfirmpasswordNodes,
                                  validator: newconfirmValidatePassword,
                                  controller: newconfirmpassword,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      labelText: 'Re-enter new passwod',
                                      labelStyle: TextStyle(
                                          fontSize: 12.sp,
                                          color: AppColor.lightButtonColor)),
                                  onFieldSubmitted: (value) {
                                    FocusScope.of(context)
                                        .requestFocus(oldpasswordNodes);
                                  },
                                ),
                                SizedBox(height: 20.w),
                                savePasswordButton(),
                                SizedBox(height: 20.w),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.w),
                  color: AppColor.appColor,
                ),
                padding: EdgeInsets.only(
                    left: 16.w, right: 16.w, top: 8.w, bottom: 8.w),
                child: AppText(
                  'change',
                  fontWeight: FontWeight.w500,
                  color: AppColor.whiteColor,
                  size: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget savePasswordButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());

            _validateInputs();
            if (_formKey.currentState!.validate()) {
              onResetPasswordAPI();
            }
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColor.appColor,
              borderRadius: BorderRadius.circular(3.w),
            ),
            child: AppText(
              'savepassword',
              textCenter: true,
              color: AppColor.whiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  //================================ Check Validation ============================//

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  //================================ Password TextFild Validation ============================//

  String? validateoldPassword(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your Old Password';
    } else if (value.length < 6) {
      return 'Old Password cannot be less than 6 characters ';
    } else {
      return null;
    }
  }

  //================================ Password TextFild Validation ============================//

  String? validatenewPassword(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter Your New Password';
    } else if (value.length < 6) {
      return 'New Password cannot be less than 6 characters ';
    } else {
      return null;
    }
  }

  //================================Confirm Password TextFild Validation ============================//

  String? newconfirmValidatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter New Confirm Password';
    } else if (value.length < 6) {
      return 'New Confirm Password cannot be less than 6 characters ';
    } else if (value != newpassword.text) {
      return 'New Confirm Password Doesn\u0027t match';
    } else {
      return null;
    }
  }

  dynamic onResetPasswordAPI() async {
    // show loader
    Loader().showLoader(context);
    final ResetPaswwordModel isresetpaswword = await repository.onResetPassword(
        oldpassword.text, newpassword.text, newconfirmpassword.text);
    if (isresetpaswword.success!) {
      FocusScope.of(context).requestFocus(FocusNode());
      Loader().hideLoader(context);
      Navigator.pop(context);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: AppText(
              isresetpaswword.error!,
              size: 16.sp,
              textCenter: true,
              fontWeight: FontWeight.w500,
              color: AppColor.green,
            ),
            actions: <Widget>[
              Center(
                child: TextButton(
                  child: AppText(
                    'OK',
                    size: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.appColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          );
        },
      );
    } else {
      Loader().hideLoader(context);
      showSnackBar(context, isresetpaswword.error.toString());
    }
  }

  Widget logoutButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            PrefObj.preferences!.clear();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const StartingScreen2()),
                    (Route<dynamic> route) => false);
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              color: AppColor.appColor,
              borderRadius: BorderRadius.circular(3.w),
            ),
            child: AppText(
             Translation.of(context)!.translate('logout')!,
              size: 15,
              textCenter: true,
              color: AppColor.whiteColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
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
}
