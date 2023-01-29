import 'package:flutter_repository/src/app/view/widget/theme.dart';
import 'package:flutter/material.dart';

class SelectOption extends StatefulWidget {
  const SelectOption({
    super.key,
    required this.items,
    this.selectedValue,
    required this.hintText,
    this.onChanged,
    required this.label,
    this.color,
  });

  final List<DropdownMenuItem<String>> items;
  final String? selectedValue;
  final String hintText;
  final void Function(String?)? onChanged;
  final String label;
  final Color? color;

  @override
  State<SelectOption> createState() => SelectOptionState();
}

class SelectOptionState extends State<SelectOption> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  void reset() {
    setState(() {
      _selectedValue = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: sFontSize,
            color: widget.color,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButtonFormField(
              validator: (value) {
                if (value == null) {
                  return 'This Field is required';
                }
                return null;
              },
              isExpanded: true,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0XFF8F9BB3),
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                filled: true,
                fillColor: Colors.white,
                //const Color(0xffF2F3F7),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0XFF3F414E),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: widget.hintText,
              ),
              dropdownColor: const Color(0XFFFFFFFF),
              value: _selectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue = newValue;
                });
                widget.onChanged?.call(newValue);
              },
              items: widget.items,
            ),
          ),
        ),
      ],
    );
  }
}
