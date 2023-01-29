import 'package:flutter/material.dart';

class FlatButtonIcon extends StatelessWidget {
  const FlatButtonIcon({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const RoundedRectangleBorder()),
        padding:
            MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 11)),
        foregroundColor: MaterialStateProperty.all(Colors.blueGrey[200]),
      ),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
