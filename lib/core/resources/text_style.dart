import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  static TextStyle buttonName(double fontsize, Color textColor) {
    return GoogleFonts.roboto(
      fontSize: fontsize,
      fontWeight: FontWeight.w400,
      color: textColor,
    );
  }
}
