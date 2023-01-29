import 'package:flutter/material.dart';

class TextArea extends FormField<String> {
  TextArea({
    super.key,
    TextEditingController? controller,
    required String label,
    super.validator,
    super.onSaved,
  }) : super(
          builder: (field) {
            final inputBorder = OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            );
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    color: Color(0XFF3F414E),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  minLines: 3,
                  maxLines: 3,
                  onChanged: field.didChange,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    //const Color(0xffF2F3F7),
                    errorText: field.errorText,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0XFF3F414E),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: inputBorder,
                    border: inputBorder,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 18,
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
