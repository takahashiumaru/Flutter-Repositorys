// ignore: lines_longer_than_80_chars
// ignore_for_file: invalid_use_of_protected_member, inference_failure_on_function_return_type

import 'package:flutter_repository/src/app/view/widget/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends FormField<String> {
  DatePicker({
    super.key,
    TextEditingController? controller,
    super.validator,
    Function(String?)? super.onSaved,
    required String label,
  }) : super(
          initialValue: '',
          builder: (field) {
            late TextEditingController controllerTextField;

            if (controller != null) {
              controllerTextField = controller;
            } else {
              controllerTextField = TextEditingController();
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: sFontSize,
                    color: field.errorText != null ? redColor : secondaryColor,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: controllerTextField,
                  textAlign: TextAlign.left,
                  cursorColor: whiteColor,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: secondaryColor, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 16,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0XFFADBBD4)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorText: field.errorText,
                    suffixIcon: Icon(
                      Icons.calendar_today_outlined,
                      color: field.errorText != null ? redColor : const Color(0XFFADBBD4),
                      size: 19,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0XFFADBBD4),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: field.context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                        2000,
                      ),
                      lastDate: DateTime(9000),
                    );
                    if (pickedDate != null) {
                      final formattedDate = DateFormat('d MMM yy').format(pickedDate);
                      controllerTextField.text = formattedDate;
                      field.setValue(formattedDate);
                    } else {
                      field.setValue('ada');
                    }
                  },
                ),
              ],
            );
          },
        );
}
