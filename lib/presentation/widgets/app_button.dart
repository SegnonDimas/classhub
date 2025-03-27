import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final double? verticalPadding;
  final double? horizontalPadding;

  const AppButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color,
    this.textColor,
    this.verticalPadding,
    this.horizontalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.purple,
        foregroundColor: textColor ?? Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 20,
          vertical: verticalPadding ?? 12,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
