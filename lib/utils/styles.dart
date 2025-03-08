import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static TextStyle input(Color? color, BuildContext context, double? size, FontWeight? fontWeight) {
    return
    GoogleFonts.dmSans(textStyle: TextStyle(color: color ?? Theme.of(context).hintColor, fontSize: size, fontWeight: fontWeight ?? FontWeight.normal));
  }
  static TextStyle onlyStyle(Color? color, BuildContext context, double? size, FontWeight? fontWeight) {
    return
    GoogleFonts.poppins(textStyle: TextStyle(color: color ?? Theme.of(context).hintColor, fontSize: size, fontWeight: fontWeight ?? FontWeight.normal));
  }
}
