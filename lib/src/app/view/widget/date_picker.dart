// ignore_for_file: avoid_print
import 'package:flutter_repository/src/app/view/widget/theme.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    this.initialValue,
    required this.label,
    this.controller,
    this.onTap,
  });
  final DateTime? initialValue;
  final String label;
  final TextEditingController? controller;
  final void Function()? onTap;

  @override
  State<StatefulWidget> createState() {
    return _DatePicker();
  }
}

class _DatePicker extends State<DatePicker> {
  TextEditingController dateInput = TextEditingController();
  late final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      dateInput.text = DateFormat('dd-MM-yyyy').format(widget.initialValue!);
    }
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
          controller: widget.controller != null ? controller : dateInput,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            //const Color(0xffF2F3F7),
            suffixIcon: const Icon(
              Icons.calendar_today_outlined,
              color: Color(0XFF8F9BB3),
              size: 19,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0XFF3F414E),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 16,
            ),
          ),
          readOnly: true,
          onTap: () async {
            final pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2022),
              lastDate: DateTime(3000),
            );

            if (pickedDate != null) {
              final formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
              setState(() {
                //parsed formated date to controller
                widget.controller != null
                    ? controller.text = formattedDate
                    : dateInput.text = formattedDate;
                //parsed formated date to formfield
                widget.controller != null
                    ? widget.controller!.text = formattedDate
                    : dateInput.text = formattedDate;
              });
            } else {}
          },
        ),
      ],
    );
  }
}
