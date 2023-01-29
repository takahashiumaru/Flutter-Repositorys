import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SortButton extends StatelessWidget {
  const SortButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 11),),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          foregroundColor: MaterialStateProperty.all(Colors.blueGrey[200]),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder()),
        ),
        onPressed: () {},
        child: const Icon(FontAwesomeIcons.ellipsisH),
      ),
    );
  }
}
