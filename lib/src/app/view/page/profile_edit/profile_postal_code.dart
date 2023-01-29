// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter_repository/src/app/view/widget/button.dart';
import 'package:flutter_repository/src/app/view/widget/theme.dart';
import 'package:flutter/material.dart';

class ProfilePostalCode extends StatefulWidget {
  const ProfilePostalCode({super.key});

  @override
  State<ProfilePostalCode> createState() => _ProfilePostalCode();
}

class _ProfilePostalCode extends State<ProfilePostalCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: Transform.translate(
          offset: const Offset(7, 0),
          child: IconButton(
            padding: const EdgeInsets.only(right: 18),
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            iconSize: 24,
          ),
        ),
        title: const Text('Edit Postal Code'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              left: 30,
            ),
            child: const Text(
              'Isi Sesuai KTP !',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: '@Postal Code',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  maxLength: 20,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: const Button(
                color: primaryColor,
                // onPressed: () {
                //         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DeflasiPages(),));
                //       },
                child: Text(
                  'Save',
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
