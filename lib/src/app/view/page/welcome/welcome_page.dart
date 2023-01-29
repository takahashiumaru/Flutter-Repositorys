// ignore_for_file: lines_longer_than_80_chars, inference_failure_on_instance_creation

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_repository/src/app/view/page/verify_otp/verify_otp_page.dart';
import 'package:flutter_repository/src/app/view/widget/theme.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_repository/src/app/view/widget/button.dart';
// import 'package:authentication_repository/authentication_repository.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage> {
  int _current = 0;
  // late final AuthenticationRepository authenticationRepository;

  final CarouselController _controller = CarouselController();

  final List<Widget> content = [
    const WelcomeOne(),
    const WelcomeTwo(),
    const WelcomeThree(),
    const WelcomeFour()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // children: const [FlutterLogo()],
            ),
          ),
          body: SafeArea(
            child: ListView(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 60),
                        child: const Text(
                          'Hello!',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 30),
                        width: 400,
                        height: 450,
                        child: CarouselSlider(
                          items: content,
                          //Slider Container properties
                          options: CarouselOptions(
                            height: 650,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: content.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 10,
                              height: 12,
                              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(_current == entry.key ? 0.9 : 0.4),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                          child: ClipOval(
                        child: Material(
                          color: Colors.blue, // Button color
                          child: InkWell(
                            splashColor: Colors.red, // Splash color
                            onTap: () {
                              Navigator.push(context, Verifotp.route());
                            },
                            child: const SizedBox(
                                width: 56,
                                height: 56,
                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class WelcomeOne extends StatelessWidget {
  const WelcomeOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        children: [
          Image.asset(
            'asset/img/image_welcome_1.png',
            width: 270,
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            width: 270,
            child: Text(
              'Appclication Super Canggih',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Memanage data yang kamu butuhkan',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeTwo extends StatelessWidget {
  const WelcomeTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        children: [
          Image.asset(
            'asset/img/image_welcome_1.png',
            width: 270,
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            width: 270,
            child: Text(
              'Appclication Super Canggih',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Memanage data yang kamu butuhkan',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeThree extends StatelessWidget {
  const WelcomeThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        children: [
          Image.asset(
            'asset/img/image_welcome_1.png',
            width: 270,
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            width: 270,
            child: Text(
              'Appclication Super Canggih',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Memanage data yang kamu butuhkan',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeFour extends StatelessWidget {
  const WelcomeFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        children: [
          Image.asset(
            'asset/img/image_welcome_1.png',
            width: 270,
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            width: 270,
            child: Text(
              'Appclication Super Canggih',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Memanage data yang kamu butuhkan',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedSlideUp extends StatefulWidget {
  const AnimatedSlideUp({super.key});

  @override
  State<AnimatedSlideUp> createState() => _AnimatedSlideUp();
}

class _AnimatedSlideUp extends State<AnimatedSlideUp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _position;
  late Animation<double> _opacity;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _position = Tween<double>(begin: 10, end: 60).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0, 1)),
    )..addListener(() {
        setState(() {});
      });

    _opacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(.5, 1)),
    )..addListener(() {
        setState(() {});
      });
    // Always repeat animation
    _controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: _position.value),
            child: Opacity(
              opacity: _opacity.value,
              child: const Icon(
                CommunityMaterialIcons.chevron_double_up,
                color: primaryColor,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
