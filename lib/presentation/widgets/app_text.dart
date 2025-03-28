import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final String? fontFamily;
  @Deprecated("Use color")
  final Color? textColor;
  final Color? color;
  final TextOverflow? overflow;
  final int? maxLines;
  const AppText({
    super.key,
    this.text,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.textColor,
    this.color,
    this.overflow,
    this.maxLines,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text ?? '',
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
      style:
          fontFamily == null
              ? GoogleFonts.poppins(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: textColor ?? color,
              )
              : TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: textColor ?? color,
                fontFamily: fontFamily,
              ),
    );
  }
}
