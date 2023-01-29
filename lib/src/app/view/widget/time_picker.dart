import 'package:flutter_repository/src/app/view/widget/theme.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({
    super.key,
    this.initialValue,
    required this.label,
    this.controller,
  });
  final DateTime? initialValue;
  final String label;
  final TextEditingController? controller;

  @override
  State<StatefulWidget> createState() {
    return _TimePicker();
  }
}

class _TimePicker extends State<TimePicker> {
  final TextEditingController timeInput = TextEditingController();
  late final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    if (widget.initialValue != null) {
      timeInput.text = DateFormat('HH:mm').format(widget.initialValue!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: sFontSize,
            color: secondaryColor,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          validator: RequiredValidator(errorText: 'This field is required'),
          keyboardType: TextInputType.text,
          controller: widget.controller != null ? controller : timeInput,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            //const Color(0xffF2F3F7),
            suffixIcon: const Icon(
              Icons.watch_later_outlined,
              color: Color(0XFF8F9BB3),
              size: 20,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0XFF3F414E),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 14,
            ),
          ),
          readOnly: true,
          onTap: () async {
            final pickedTime = await showTimePicker(
              initialTime: TimeOfDay.now(),
              context: context,
            );

            if (pickedTime != null && mounted) {
              final parsedTime = DateFormat.jm().parse(pickedTime.format(context));

              final formattedTime = DateFormat('HH:mm').format(parsedTime);

              setState(() {
                widget.controller != null
                    ? controller.text = formattedTime
                    : timeInput.text = formattedTime;
                widget.controller != null
                    ? widget.controller!.text = formattedTime
                    : timeInput.text = formattedTime;
              });
            } else {}
          },
        ),
      ],
    );
  }
}
