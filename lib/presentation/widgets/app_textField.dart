import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final double? horizontalPadding;
  final double? verticalPadding;

  const AppTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.horizontalPadding,
    this.verticalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 16,
            vertical: verticalPadding ?? 12,
          ),
        ),
      ),
    );
  }
}
