// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter_repository/src/app/view/widget/theme.dart';
import 'package:flutter/material.dart';

class InputSearch extends FormField<String> {
  InputSearch({
    super.key,
    required String label,
    TextEditingController? controller,
    super.validator,
    Function(String?)? super.onSaved,
  }) : super(
          builder: (field) {
            final inputBorder = OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0XFF3F414E)),
              borderRadius: BorderRadius.circular(8),
            );
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
                const SizedBox(height: 6),
                TextFormField(
                  controller: controller,
                  onChanged: field.didChange,
                  decoration: InputDecoration(
                    hintText: 'Search..',
                    hintStyle: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0XFF3F414E),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 18),
                    filled: true,
                    errorText: field.errorText,
                    hoverColor: const Color(0XFFEDF1F7),
                    fillColor: const Color(0XFFFFFFFF),
                    border: inputBorder,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0XFF3F414E),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0XFF3F414E),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0XFF3F414E),
                      size: 20,
                    ),
                  ),
                  cursorColor: const Color(0XFF3F414E),
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
