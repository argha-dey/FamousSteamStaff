import 'package:famous_steam_staff/global/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool? obscureText;
  final String? Function(String?)? validateName;
  final FocusNode focusNode;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final int? maxTextLength;
  const CTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText,
    this.validateName,
    this.autovalidateMode,
    required this.focusNode,
    this.textInputType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.maxTextLength,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: maxTextLength,
      focusNode: focusNode,
      validator: validateName,
      keyboardType: textInputType ?? TextInputType.emailAddress,
      textInputAction: textInputAction,
      obscureText: obscureText ?? false,

      style: GoogleFonts.montserrat(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColor.appColor,
      ),
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.appColor, width: 2.0),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.appColor, width: 2.0),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.montserrat(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColor.appColor,
        ),
      ),
    );
  }
}
