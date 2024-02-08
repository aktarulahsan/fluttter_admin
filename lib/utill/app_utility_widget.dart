import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wah_admin/infrastructure/theme/app_colors.dart';

class AppUtility {
  static TextStyle quizHeader = const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500,
      fontFamily: 'SFProDisplay',
      color: black,
      letterSpacing: 1);

  static TextStyle get headerTextStyle3 {
    return GoogleFonts.notoSans(
        textStyle: TextStyle(
            // fontFamily: normal,
            fontSize: GetPlatform.isIOS ? 16 : 17,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? Colors.white : text3Color));
  }

  static TextStyle get smallTextStyle3 {
    return GoogleFonts.roboto(
        textStyle: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: GetPlatform.isIOS ? 12 : 13,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? Colors.white : text3Color));
  }
}
