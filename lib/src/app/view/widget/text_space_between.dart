// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';

class TextSpaceBetween extends StatelessWidget {
  const TextSpaceBetween({
    super.key,
    required this.textRight,
    required this.textLeft,
    this.onTapTextRight,
  });
  final Text textRight;
  final Text textLeft;
  final Function()? onTapTextRight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textLeft,
        InkWell(
          onTap: onTapTextRight,
          child: textRight,
        )
      ],
    );
  }
}
