// ignore_for_file: inference_failure_on_function_return_type, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputVerify extends FormField<String> {
  InputVerify({
    super.key,
    bool? isNumber = false,
    required String label,
    TextEditingController? controller,
    super.validator,
    Function(String?)? super.onSaved,
  }) : super(
          builder: (field) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    color: field.errorText != null ? Colors.red : const Color(0XFF8F9BB3),
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: isNumber! ? TextInputType.number : TextInputType.text,
                    controller: controller,
                    onChanged: field.didChange,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(4),
                    ],
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 18),
                      filled: true,
                      errorText: field.errorText,
                      hoverColor: const Color(0XFFEDF1F7),
                      fillColor: const Color(0XFFFFFFFF),
                      // border: inputBorder,
                      // enabledBorder: inputBorder,
                      hintText: 'X - X - X - X',
                    ),
                  ),
                ),
              ],
            );
          },
        );

  @override
  FormFieldState<String> createState() => _InputTextState();
}

class _InputTextState extends FormFieldState<String> {
  @override
  void initState() {
    super.initState();
    setValue('');
  }
}
