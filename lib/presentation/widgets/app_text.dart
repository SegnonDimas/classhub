import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
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
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text ?? '',
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor ?? color,
      ),
    );
  }
}
