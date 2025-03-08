import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CText extends StatelessWidget {
  const CText({super.key, required this.text, this.color, this.fontWeight, this.size});
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.dmSans(textStyle: TextStyle(color: color ?? Theme.of(context).hintColor, fontSize: size, fontWeight: fontWeight ?? FontWeight.normal)),
    );
  }
}
