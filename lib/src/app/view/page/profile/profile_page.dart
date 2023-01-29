// ignore_for_file: lines_longer_than_80_chars, inference_failure_on_instance_creation, inference_failure_on_function_invocation, unused_element, inference_failure_on_function_return_type, strict_raw_type
import 'package:flutter_repository/src/app/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_repository/src/app/model/user_respository.dart';
import 'package:flutter_repository/src/app/util/size.dart';
import 'package:flutter_repository/src/app/view/page/profile/config.dart';
import 'package:flutter_repository/src/app/view/page/profile/privacy_policy.dart';
import 'package:flutter_repository/src/app/view/page/profile/profile_edit.dart';
import 'package:flutter_repository/src/app/view/page/profile/terms_conditional.dart';
import 'package:flutter_repository/src/app/view/widget/button.dart';
import 'package:flutter_repository/src/app/view/widget/container_profile.dart';
import 'package:flutter_repository/src/app/view/widget/popup.dart';
import 'package:flutter_repository/src/app/view/widget/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => authenticationBloc..add(AuthenticationSignOut())),
        ],
        child: const ProfilePage(),
      ),
    );
  }

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // const _Profile(),
            // Divider(thickness: 16, color: Colors.grey[100]),
            Expanded(
              child: ColoredBox(
                color: Colors.white,
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const _Profile(),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                        'General',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {},
                      child: ContainerProfile(label: 'Employee', icon: Icons.people),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Config(),
                          ),
                        );
                      },
                      child: ContainerProfile(label: 'Config', icon: Icons.category_rounded),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                        'Support',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const TermsConditions(),
                          ),
                        );
                      },
                      child:
                          ContainerProfile(label: 'Term And Conditions', icon: Icons.verified_user),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PrivacyPolicy(),
                          ),
                        );
                      },
                      child: ContainerProfile(label: 'Privacy Police', icon: Icons.info),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: bottomsheetcategoty,
                      child: ContainerProfile(label: 'Feedback', icon: Icons.sms),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {},
                      child: ContainerProfile(label: 'Contact', icon: Icons.help),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 30),
                      child: const Text(
                        'Version 1.0.00',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        showDialog<bool?>(
                          context: context,
                          builder: (context) {
                            return CardForm(
                              popup: true,
                              title: 'Logout',
                              icon: FontAwesomeIcons.exclamationTriangle,
                              actions: [
                                Button(
                                  mini: true,
                                  color: Colors.white,
                                  child: const Text('Cancel'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                const SizedBox(width: 10),
                                Button(
                                  mini: true,
                                  child: const Text('Logout'),
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                )
                              ],
                              child: const Text('Are you sure you want to logout?'),
                            );
                          },
                        ).then((value) {
                          if (value ?? false) {
                            userRepository.logoutUser();
                            authenticationBloc.add(AuthenticationSignOut());
                            Navigator.pop(context);
                          }
                        });
                      },
                      child: ContainerProfile(label: 'Logout', icon: Icons.exit_to_app),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void bottomsheetcategoty() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              // width: 400,
              child: Image.asset('asset/img/no5.png'),
            ),
            const Text(
              'Waktunya Kasih Bintang,nih',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Seberapa puas kamu dengan \n aplikasi Voltunes ?',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 15),
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                RatingBar.builder(
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  updateOnDrag: true,
                  onRatingUpdate: (rating) {},
                )
              ],
            ),
            // Container(
            //   padding: const EdgeInsets.only(left: 20, right: 20),
            //   child: TextFormField(
            //     minLines: 2, // any number you need (It works as the rows for the textarea)
            //     keyboardType: TextInputType.multiline,
            //     maxLines: null,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(15.0),
            //       ),
            //       hintText: 'Message',
            //     ),
            //   ),
            // ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                width: 350,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => ProfilePage(),
                    // ));
                  },
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Rate This APP',
                    style: TextStyle(
                        fontFamily: 'Montserrat', fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.label,
  });

  final IconData icon;
  final Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    final textColor = Colors.blueGrey[600];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingHorizontalPage),
      child: ListTile(
        onTap: onPressed,
        leading: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
            borderRadius: const BorderRadius.all(
              Radius.circular(14),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              icon,
              color: textColor,
            ),
          ),
        ),
        title: Text(
          label,
          style: TextStyle(fontFamily: 'Montserrat', color: textColor, fontWeight: FontWeight.bold),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_right_outlined,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              'asset/img/Avatar.png',
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${userRepository.user.name} (${userRepository.user.role})',
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                '(+62) 865 8324 43213',
                style: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          const SizedBox(
            width: 70,
          ),
          const _EditProfileButton()
        ],
      ),
    );
  }
}

class _EditProfileButton extends StatelessWidget {
  const _EditProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ProfileEdit(),
          ),
        );
      },
      child: const Icon(
        Icons.edit,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}
