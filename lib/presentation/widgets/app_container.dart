import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final Color? color;
  final double? borderRadius;

  const AppContainer({
    Key? key,
    required this.child,
    this.padding,
    this.color,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
        ],
      ),
      child: child,
    );
  }
}
