import 'package:flutter/material.dart';

class ChipLabel extends StatelessWidget {
  const ChipLabel({
    super.key,
    required this.labelText,
    required this.onDeleted,
    required this.color,
  });
  final Color? color;
  final String labelText;
  final void Function() onDeleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Chip(
        backgroundColor: color?.withOpacity(.4),
        label: Text(labelText),
        deleteIcon: CircleAvatar(
          backgroundColor: color?.withOpacity(.7),
          foregroundColor: Colors.white,
          child: const Icon(Icons.close, size: 14),
        ),
        onDeleted: onDeleted,
      ),
    );
  }
}
