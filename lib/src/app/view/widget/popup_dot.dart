import 'package:flutter/material.dart';

class CardForm extends StatelessWidget {
  const CardForm({
    super.key,
    required this.title,
    required this.icon,
    required this.actions,
    required this.child,
    this.popup = false,
  });
  final String title;
  final IconData icon;
  final Widget child;
  final List<Widget> actions;
  final bool popup;

  @override
  Widget build(BuildContext context) {
    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    icon,
                    color: const Color(0xffC89C97),
                  )
                ],
              ),
              const SizedBox(height: 20),
              child
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(
            color: Color(0XFFF8F7FB),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: actions,
          ),
        )
      ],
    );

    if (popup) {
      const borderRadiusCard = 20.0;
      return SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusCard),
        ),
        contentPadding: EdgeInsets.zero,
        children: [body],
      );
    } else {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: body,
      );
    }
  }
}
