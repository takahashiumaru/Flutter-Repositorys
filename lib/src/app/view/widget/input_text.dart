import 'package:flutter_repository/src/app/util/theme_variabel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputText extends FormField<String> {
  InputText({
    super.key,
    required String label,
    TextEditingController? controller,
    super.validator,
    bool? isNumber = false,
    dynamic Function(String?)? super.onSaved,
  }) : super(
          builder: (field) {
            final inputBorder = OutlineInputBorder(
              borderSide: const BorderSide(color: Color.fromARGB(255, 193, 202, 219)),
              borderRadius: BorderRadius.circular(12),
            );
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    color: field.errorText != null ? Colors.red : blackColor,
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: TextFormField(
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                    ),
                    keyboardType: isNumber == true ? TextInputType.number : TextInputType.text,
                    inputFormatters: [
                      if (isNumber == true) FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                      // else
                      //   FilteringTextInputFormatter.allow(
                      //     RegExp('[a-zA-Z" "]'),
                      //   ),
                    ],
                    controller: controller,
                    onChanged: field.didChange,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 18),
                      filled: true,
                      errorText: field.errorText,
                      hoverColor: const Color(0XFFEDF1F7),
                      fillColor: const Color(0XFFFFFFFF),
                      border: inputBorder,
                      enabledBorder: inputBorder,
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

class InputTextNumber extends FormField<String> {
  InputTextNumber({
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
                TextFormField(
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                  ),
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
  FormFieldState<String> createState() => _InputTextNumberState();
}

class _InputTextNumberState extends FormFieldState<String> {
  String? textValue;
  @override
  void initState() {
    super.initState();
    setValue('');
  }
}
