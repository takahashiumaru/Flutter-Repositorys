import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });
  final String label;
  final IconData icon;
  final void Function() onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff1785ff) : null,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
        child: Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Center(
                child: FaIcon(
                  icon,
                  color: isSelected ? const Color(0xfff0f7ff) : const Color(0xff9ba6ae),
                  size: 15,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: isSelected ? const Color(0xfff0f7ff) : const Color(0xff2f3e4d),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuItemButton extends StatelessWidget {
  const MenuItemButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.number = 0,
  });
  final void Function() onTap;
  final String label;
  final IconData icon;
  final int number;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Center(
                child: FaIcon(
                  icon,
                  color: const Color(0xff9ba6ae),
                  size: 15,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              label,
              style: const TextStyle(fontFamily: 'Montserrat', color: Color(0xff9ba5ad)),
            ),
            const Spacer(),
            if (number != 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: const BoxDecoration(
                  color: Color(0xffff3c2f),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 3),
                  child: Text(
                    number.toString(),
                    style: const TextStyle(fontFamily: 'Montserrat', color: Color(0xfff0f7ff)),
                  ),
                ),
              )
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }
}
