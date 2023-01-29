// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter_repository/src/app/view/widget/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputText extends FormField<String> {
  InputText({
    super.key,
    TextEditingController? controller,
    super.validator,
    Function(String?)? super.onSaved,
    bool? isNumber = false,
    required String label,
  }) : super(
          builder: (field) {
            late TextEditingController controllerTextField;
            if (controller != null) {
              controllerTextField = controller;
            } else {
              controllerTextField = TextEditingController();
            }

            final inputBorder = OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0XFFADBBD4),
              ),
              borderRadius: BorderRadius.circular(8),
            );
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    color: field.errorText != null ? Colors.red : secondaryColor,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  keyboardType: isNumber == true ? TextInputType.number : TextInputType.text,
                  inputFormatters: [
                    if (isNumber == true)
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    else
                      FilteringTextInputFormatter.allow(
                        RegExp('[a-zA-Z" "]'),
                      ),
                  ],
                  controller: controllerTextField,
                  onChanged: field.didChange,
                  cursorColor: secondaryColor,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: secondaryColor, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 18),
                    filled: true,
                    errorText: field.errorText,
                    hoverColor: const Color(0XFFEDF1F7),
                    fillColor: const Color(0XFFFFFFFF),
                    border: inputBorder,
                    enabledBorder: inputBorder,
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
  String? textValue;
  @override
  void initState() {
    super.initState();
    setValue('');
  }
}
