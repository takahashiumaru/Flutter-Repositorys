import 'package:flutter_repository/src/app/util/theme_variabel.dart';
import 'package:flutter/material.dart';

class InputText extends FormField<String> {
  InputText({
    super.key,
    required String label,
    TextEditingController? controller,
    super.validator,
    dynamic Function(String?)? super.onSaved,
  }) : super(
          builder: (field) {
            final inputBorder = OutlineInputBorder(
              borderSide: const BorderSide(color: Color.fromARGB(255, 193, 202, 219)),
              borderRadius: BorderRadius.circular(8),
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
