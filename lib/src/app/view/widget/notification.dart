import 'package:flutter_repository/src/app/util/theme_variabel.dart';
import 'package:flutter/material.dart';

class ContainerNotification extends FormField<String> {
  ContainerNotification({
    super.key,
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
              height: 90,
              child: Row(
                children: [
                  Image.asset(
                    'asset/img/notification.png',
                    width: 50,
                  ),
                  const SizedBox(width: 20),
                  const SizedBox(height: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        // padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: 200,
                        child: Text(
                          'Temperature Citayam-01 Kanan Atas melewati Max 30°',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: secondaryColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        // padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: 200,
                        child: Text(
                          '01.00',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: sFontSize,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
}
