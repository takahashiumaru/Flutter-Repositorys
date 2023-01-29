import 'package:flutter_repository/src/app/view/widget/theme.dart';
import 'package:flutter/material.dart';

class InputSearch extends FormField<String> {
  InputSearch({
    super.key,
    required String label,
    TextEditingController? controller,
    super.validator,
    dynamic Function(String?)? super.onSaved,
  }) : super(
          builder: (field) {
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
                    hintText: 'search..',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0XFF8F9BB3),
                      size: 20,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0XFF3F414E),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0XFFADBBD4),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 16,
                    ),
                    errorText: field.errorText,
                    hoverColor: const Color(0XFFEDF1F7),
                    fillColor: const Color(0XFFFFFFFF),
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
