// ignore_for_file: noop_primitive_operations, use_build_context_synchronously, invalid_use_of_protected_member, inference_failure_on_function_return_type, lines_longer_than_80_chars

import 'package:flutter_repository/src/app/view/widget/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePicker extends FormField<String> {
  TimePicker({
    super.key,
    required String label,
    TextEditingController? controller,
    super.validator,
    Function(String?)? super.onSaved,
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
                    errorText: field.errorText,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: secondaryColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: Icon(
                      Icons.watch_later_outlined,
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
                    final pickedTime = await showTimePicker(
                      context: field.context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      final parsedTime =
                          DateFormat.jm().parse(pickedTime.format(field.context).toString());
                      final formattedTime = DateFormat('hh:mm').format(parsedTime);
                      controllerTextField.text = formattedTime;
                      field.setValue(formattedTime);
                    }
                  },
                )
              ],
            );
          },
        );
}
