import 'package:flutter_repository/src/app/util/theme_variabel.dart';
import 'package:flutter/material.dart';

class ContainerProfile extends FormField<String> {
  ContainerProfile({
    super.key,
    required String label,
    required IconData icon,
  }) : super(
          builder: (field) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              height: 55,
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.black,
                    // Icons.category_rounded,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    label,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: sFontSize,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.chevron_right_outlined,
                    color: Colors.black,
                  ),
                ],
              ),
            );
          },
        );
}
