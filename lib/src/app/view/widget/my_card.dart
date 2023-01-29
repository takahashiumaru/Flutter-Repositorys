// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter_repository/src/app/view/widget/theme.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    this.onTap,
    this.padding,
    this.margin,
    this.width,
    required this.height,
    required this.child,
  });

  final Function()? onTap;
  final double height;
  final double? width;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: grayColor.withOpacity(0.2),
              offset: const Offset(4, 4),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
