// ignore_for_file: avoid_print, invalid_use_of_protected_member, inference_failure_on_function_return_type, lines_longer_than_80_chars, avoid_unused_constructor_parameters

import 'package:flutter_repository/src/app/model/choice.dart';
import 'package:flutter_repository/src/app/view/widget/theme.dart';
import 'package:flutter/material.dart';

String? idSelected;

class ChoiceChips extends FormField<String> {
  ChoiceChips({
    super.key,
    TextEditingController? controller,
    super.validator,
    Function(String?)? super.onSaved,
    required String label,
    required List<Choice> listChoices,
    String setValue = '',
  }) : super(
          initialValue: '',
          builder: (field) {
            late TextEditingController controllerTextField;
            if (controller != null) {
              controllerTextField = controller;
            } else {
              controllerTextField = TextEditingController();
            }
            return SizedBox(
              width: MediaQuery.of(field.context).size.width,
              child: Column(
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
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: List.generate(
                      listChoices.length,
                      (index) {
                        return ChoiceChip(
                          padding: const EdgeInsets.only(
                            top: 12,
                            bottom: 12,
                            right: 9,
                            left: 7,
                          ),
                          elevation: 0,
                          pressElevation: 0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            side: BorderSide(
                              color: field.errorText != null ? redColor : Colors.transparent,
                            ),
                          ),
                          label: Wrap(
                            children: [
                              Icon(
                                Icons.trip_origin_outlined,
                                size: 18,
                                color: idSelected == listChoices[index].label
                                    ? whiteColor
                                    : primaryColor,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                listChoices[index].label,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: idSelected == listChoices[index].label
                                      ? whiteColor
                                      : const Color(0XFF3F414E),
                                ),
                              )
                            ],
                          ),
                          selected: idSelected == listChoices[index].label,
                          backgroundColor: idSelected == listChoices[index].label
                              ? secondaryColor
                              : const Color(0XFFFEEEEC),
                          selectedColor: primaryColor,
                          onSelected: (bool selected) {
                            idSelected = listChoices[index].label;
                            controllerTextField.text = listChoices[index].label;
                            field.setState(() {
                              idSelected = listChoices[index].label;
                              field.setValue(idSelected);
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            );
          },
        );
}
