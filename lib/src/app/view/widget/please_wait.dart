import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PleaseWait extends StatelessWidget {
  const PleaseWait({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.all(18.5),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: const [
    //           CupertinoActivityIndicator(),
    //           SizedBox(width: 17),
    //           Text(
    //             'Please wait...',
    //             style: TextStyle(fontFamily: 'Montserrat',color: Colors.grey),
    //           ),
    //         ],
    //       ),
    //     )
    //   ],
    // );

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CupertinoActivityIndicator(),
          SizedBox(width: 17),
          Text(
            'Please wait...',
            style: TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
