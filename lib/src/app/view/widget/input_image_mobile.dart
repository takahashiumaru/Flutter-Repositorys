import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class InputImage extends StatefulWidget {
  const InputImage({super.key});

  @override
  State<InputImage> createState() => _InputImageState();
}

class _InputImageState extends State<InputImage> {
  File? image;

  Future<void> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (image != null)
          Container(
            width: 700,
            height: 160,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(image!),
                fit: BoxFit.fill,
              ),
              border: Border.all(width: 1.1, color: const Color(0XFF3F414E)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: MaterialButton(
              onPressed: pickImage,
              child: const Icon(
                Icons.camera_alt,
                color: Color(0XFFDFC9C7),
                size: 60,
              ),
            ),
          )
        else
          Container(
            width: 700,
            height: 160,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6),
              border: Border.all(width: 1.1, color: const Color(0XFF3F414E)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: MaterialButton(
              onPressed: pickImage,
              child: const Icon(
                Icons.camera_alt,
                color: Color(0XFF3F414E),
                size: 60,
              ),
            ),
          ),
      ],
    );
  }
}
