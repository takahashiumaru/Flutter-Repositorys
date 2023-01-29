import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({super.key, required this.coloring});
  final Color coloring;

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return const Color(0XFFFF0000);
    }

    return Checkbox(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      side: BorderSide(width: 1.5, color: widget.coloring),
      splashRadius: 0,
      checkColor: const Color(0XFFFFFFFF),
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
