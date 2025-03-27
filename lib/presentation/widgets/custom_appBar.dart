import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 10),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.elliptical(50, 15),
          bottomLeft: Radius.elliptical(50, 15),
        ),
      ),
      child: AppBar(
        backgroundColor: backgroundColor ?? Colors.transparent,
        foregroundColor: foregroundColor ?? Colors.white,
        title: Text(
          title ?? '',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: actions,
      ),
    );
  }
}
