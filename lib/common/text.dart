import 'package:famous_steam_staff/global/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  String text;
  Color color;
  double size;
  FontWeight fontWeight;
  double wordspace;
  TextStyle? textStyle;
  bool isUnderline;
  bool texteclip;
  bool textCenter;
  AppText(
    this.text, {
    Key? key,
    this.color = AppColor.appColor,
    this.size = 14,
    this.fontWeight = FontWeight.w400,
    this.wordspace = 1,
    this.textCenter = false,
    this.texteclip = false,
    this.textStyle,
    this.isUnderline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isUnderline
        ? Container(
            padding: const EdgeInsets.only(
              bottom: 2, // Space between underline and text
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: color,
                  width: 1.0, // Underline thickness
                ),
              ),
            ),
            child: Text(
              text,
              overflow: TextOverflow.clip,
              textAlign: textCenter ? TextAlign.center : null,
              style: GoogleFonts.montserrat(
                color: color,
                fontSize: size.sp,
                fontWeight: fontWeight,
                wordSpacing: wordspace,
                textStyle: textStyle,
              ),
            ),
          )
        : Text(
            text,
            overflow: !texteclip ? TextOverflow.clip : TextOverflow.ellipsis,
            maxLines: !texteclip ? 10 : 2,
            textAlign: textCenter ? TextAlign.center : null,
            style: GoogleFonts.montserrat(
                color: color,
                fontSize: size,
                fontWeight: fontWeight,
                wordSpacing: wordspace,
                textStyle: textStyle),
          );
  }
}
