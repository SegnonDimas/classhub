import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final Color? color;
  final double? borderRadius;
  final List<BoxShadow>? boxShadow;
  final double? height;
  final double? width;

  const AppContainer({
    Key? key,
    required this.child,
    this.padding,
    this.color,
    this.borderRadius,
    this.boxShadow,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        boxShadow:
            boxShadow ??
            [
              BoxShadow(
                color: Theme.of(
                  context,
                ).colorScheme.inverseSurface.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
      ),
      child: child,
    );
  }
}
