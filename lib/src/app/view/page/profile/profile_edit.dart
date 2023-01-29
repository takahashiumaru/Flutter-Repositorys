// ignore_for_file: lines_longer_than_80_chars, inference_failure_on_instance_creation

import 'dart:io';

import 'package:flutter_repository/src/app/view/page/profile_edit/profile_address.dart';
import 'package:flutter_repository/src/app/view/page/profile_edit/profile_email.dart';
import 'package:flutter_repository/src/app/view/page/profile_edit/profile_handphone.dart';
import 'package:flutter_repository/src/app/view/page/profile_edit/profile_nama_blkng.dart';
import 'package:flutter_repository/src/app/view/page/profile_edit/profile_nama_dpn.dart';
import 'package:flutter_repository/src/app/view/page/profile_edit/profile_no_ktp.dart';
import 'package:flutter_repository/src/app/view/page/profile_edit/profile_password.dart';
import 'package:flutter_repository/src/app/view/page/profile_edit/profile_postal_code.dart';
import 'package:flutter_repository/src/app/view/page/profile_edit/profile_username.dart';
import 'package:flutter_repository/src/app/view/widget/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEdit();
}

class _ProfileEdit extends State<ProfileEdit> {
  File? imageFile;
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
        title: const Text('Edit Profile'),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 20,
          top: 15,
          right: 20,
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    if (imageFile != null)
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(fit: BoxFit.cover, image: FileImage(imageFile!)),
                        ),
                      )
                    else
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2015/11/16/14/43/cat-1045782_1280.jpg',
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      getImage(source: ImageSource.gallery);
                    },
                    child: const Text(
                      'Ubah Foto Profile',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 100,
                height: 175,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Info Profile',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(right: 200, bottom: 3),
                            child: const Icon(
                              Icons.info_outline,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Nama Depan',
                            style: TextStyle(fontFamily: 'Montserrat', fontSize: 17),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(right: 50),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProfileNamaDepan(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Isi Sesuai KTP',
                                style: TextStyle(
                                    fontFamily: 'Montserrat', fontSize: 17, color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Nama Belakang',
                            style: TextStyle(fontFamily: 'Montserrat', fontSize: 17),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(right: 50),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProfileNamaBelakang(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Isi Sesuai KTP',
                                style: TextStyle(
                                    fontFamily: 'Montserrat', fontSize: 17, color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Username',
                            style: TextStyle(fontFamily: 'Montserrat', fontSize: 17),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(left: 30),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProfileUsername(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Buat Username Unik',
                                style: TextStyle(
                                    fontFamily: 'Montserrat', fontSize: 17, color: Colors.grey),
                              ),
                            ),
                          ),
                          const Spacer()
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 100,
                height: 275,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Info Pribadi',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(right: 195, bottom: 2),
                            child: const Icon(
                              Icons.info_outline,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text(
                            'No KTP',
                            style: TextStyle(fontFamily: 'Montserrat', fontSize: 17),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(right: 50),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProfileNoKTP(),
                                  ),
                                );
                              },
                              child: const Text(
                                '274982374892742934',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text(
                            'No Handphone',
                            style: TextStyle(fontFamily: 'Montserrat', fontSize: 17),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(right: 50),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProfileHandphone(),
                                  ),
                                );
                              },
                              child: const Text(
                                '0867254623862',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(fontFamily: 'Montserrat', fontSize: 17),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(right: 50),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProfileEmail(),
                                  ),
                                );
                              },
                              child: const Text(
                                'example@gmail.com',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Address',
                            style: TextStyle(fontFamily: 'Montserrat', fontSize: 17),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(right: 50),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProfileAddress(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Isi Sesuai KTP',
                                style: TextStyle(
                                    fontFamily: 'Montserrat', fontSize: 17, color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Postal Code',
                            style: TextStyle(fontFamily: 'Montserrat', fontSize: 17),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(right: 50),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProfilePostalCode(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Isi Sesuai KTP',
                                style: TextStyle(
                                    fontFamily: 'Montserrat', fontSize: 17, color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Password',
                            style: TextStyle(fontFamily: 'Montserrat', fontSize: 17),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(right: 50),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ProfilePassword(),
                                  ),
                                );
                              },
                              child: const Text(
                                '****************',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          // const Spacer(),
                          // IconButton(
                          //   onPressed: () {
                          //     // Navigator.push(
                          //     //   context,
                          //     //   DeflasiCreate.route(),
                          //     // );
                          //   },
                          //   icon: const Icon(
                          //     Icons.arrow_forward_ios,
                          //     size: 15,
                          //   ),
                          //   color: Colors.black,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(
      source: source, maxWidth: 640, maxHeight: 480, imageQuality: 100, //0 - 100
    );

    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
}
