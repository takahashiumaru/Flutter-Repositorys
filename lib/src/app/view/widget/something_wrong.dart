import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SomethingWrong extends StatelessWidget {
  const SomethingWrong({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'asset/svg/warning.svg',
              height: 200,
            ),
            const SizedBox(height: 18),
            const Text(
              'Oops!',
              style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 5),
            Text(
              'Something went wrong,${onTap != null ? ' tap to' : ''} try again',
            ),
          ],
        ),
      ),
    );
  }
}
