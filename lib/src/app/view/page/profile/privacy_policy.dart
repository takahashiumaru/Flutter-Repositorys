// ignore_for_file: unused_element, lines_longer_than_80_chars

import 'package:flutter_repository/src/app/util/color.dart';
import 'package:flutter_repository/src/app/util/size.dart';
import 'package:flutter/material.dart';
// import 'registrasi_form.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  // static Widget prepare(AuthenticationRepository authenticationRepository) {
  //   return MultiBlocProvider(
  //     providers: [
  //       BlocProvider(
  //         create: (_) => LoginBloc(authenticationRepository: authenticationRepository),
  //       ),
  //     ],
  //     child: const RegistrasiPage(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // children: const [FlutterLogo()],
            ),
          ),
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
            title: const Text('Privacy Policy'),
          ),
          body: SafeArea(
            child: Center(
              child: ListView(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 300,
                          height: 120,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('asset/img/no5.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Center(
                  //   child: Column(
                  //     children: [
                  //       Container(
                  //         width: 600,
                  //         height: 220,
                  //         decoration: const BoxDecoration(
                  //           image: const DecorationImage(
                  //             image: const AssetImage("asset/img/login.png"),
                  //             fit: BoxFit.cover,
                  //           ),
                  //         ),
                  //         child: const _TextAppName(),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: paddingHorizontalPage,
                        ),
                        child: const SizedBox(height: 2 * 2),
                      ),
                      // const RegistrasiForm(),

                      const SizedBox(height: 20),
                      _ForgotPassword(
                        colorScheme: colorScheme,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ForgotPassword extends StatelessWidget {
  const _ForgotPassword({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Center(
            child: Text(
              '1. Privacy Policy for Voltunes',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w700),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Center(
            child: Text(
              'At Voltunes, accessible from Voltunes, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by Voltunes and how we use it.If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Center(
            child: Text(
              '2. Log Files',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w700),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Center(
            child: Text(
              'Voltunes follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services" analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that i personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users" movement on the website, and gathering demographic information. Our Privacy Policy was created with the help of the Privacy Policy Generator.',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Center(
            child: Text(
              '3. Cookies and Web Beacons',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w700),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Center(
            child: Text(
              'Like any other website, Voltunes uses "cookies". These cookies are used to store information including visitors" preferences, and the pages on the website that the visitor accessed or visited. The information is used to optimize the users" experience by customizing our web page content based on visitors" browser type and/or other information.',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Center(
            child: Text(
              '4. Privacy Policies',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w700),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Center(
            child: Text(
              'You may consult this list to find the Privacy Policy for each of the advertising partners of Voltunes.\nThird-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on Voltunes, which are sent directly to users browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Center(
            child: Text(
              '5. Privacy Policies',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w700),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Center(
            child: Text(
              'You may consult this list to find the Privacy Policy for each of the advertising partners of Voltunes.\nThird-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on Voltunes, which are sent directly to users browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.\nNote that Voltunes has no access to or control over these cookies that are used by third-party advertisers.',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Center(
            child: Text(
              '6. Third Party Privacy Policies',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w700),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Center(
            child: Text(
              "Voltunes's Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.\n You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers' respective websites. What Are Cookies?",
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Center(
            child: Text(
              "7. Children's Information",
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w700),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Center(
            child: Text(
              'Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.\nVoltunes does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Center(
            child: Text(
              '8. Online Privacy Policy Only',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w700),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Center(
            child: Text(
              'This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in Voltunes. This policy is not applicable to any information collected offline or via channels other than this website.',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Center(
            child: Text(
              '9. Consent',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w700),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Center(
            child: Text(
              'By using our website, you hereby consent to our Privacy Policy and agree to its Terms and Conditions.',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }
}

class _TextAppName extends StatelessWidget {
  const _TextAppName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Welcome to the\n Voltune application',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: colorScheme.primary.darken(.2),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

        // const SizedBox(height: 20),
        // InputText(
        //   label: 'Jumlah Panen',
        // ),
      ],
    );
  }
}
