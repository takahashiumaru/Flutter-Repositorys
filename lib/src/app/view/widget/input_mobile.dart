import 'package:flutter/cupertino.dart';
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
                    color: Color(0XFF3F414E),
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: controller,
                  onChanged: field.didChange,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0XFF3F414E),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 18),
                    filled: true,
                    errorText: field.errorText,
                    fillColor: Colors.white,
                    //const Color(0xffF2F3F7),
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
  @override
  void initState() {
    super.initState();
    setValue('');
  }
}

class InputOptions extends StatelessWidget {
  const InputOptions({
    super.key,
    required this.label,
    this.controller,
  });

  final String label;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontFamily: 'Montserrat', color: Colors.blueGrey[400])),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Row(
            children: const [
              Expanded(
                child: SlidingSegmentedControl(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SlidingSegmentedControl extends StatefulWidget {
  const SlidingSegmentedControl({
    super.key,
  });

  @override
  State<SlidingSegmentedControl> createState() => _SlidingSegmentedControlState();
}

class _SlidingSegmentedControlState extends State<SlidingSegmentedControl> {
  String value = 'text';

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
      padding: const EdgeInsets.all(6),
      groupValue: value,
      children: const {
        'text': _Option(label: 'Text'),
        'text-multiline': _Option(label: 'Text-Multiline'),
        'number': _Option(label: 'Number'),
        'date': _Option(label: 'Date'),
      },
      onValueChanged: (String? value) {
        if (value != null) {
          setState(() {
            this.value = value;
          });
        }
      },
    );
  }
}

class _Option extends StatelessWidget {
  const _Option({
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
