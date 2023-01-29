import 'package:flutter/material.dart';

class GreyScale extends StatelessWidget {

  const GreyScale({
    super.key,
    this.value = false,
    required this.onTap,
    required this.child,
  });
  final Widget child;
  final bool value;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: value
          ? ColorFiltered(
              colorFilter: const ColorFilter.matrix(<double>[
                0.2126,
                0.7152,
                0.0722,
                0,
                0,
                0.2126,
                0.7152,
                0.0722,
                0,
                0,
                0.2126,
                0.7152,
                0.0722,
                0,
                0,
                0,
                0,
                0,
                1,
                0,
              ]),
              child: child,
            )
          : child,
    );
  }
}
