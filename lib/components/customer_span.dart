import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CTSpan {
  static TextSpan spanText(BuildContext context, double size, Color? color, FontWeight? fontWeight, String text) => TextSpan(text: text, style: GoogleFonts.dmSans(textStyle: TextStyle(color: color ?? Theme.of(context).hintColor, fontSize: size, fontWeight: fontWeight ?? FontWeight.normal)));
}
