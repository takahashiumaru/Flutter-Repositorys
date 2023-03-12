// ignore_for_file: unused_element, lines_longer_than_80_chars, inference_failure_on_instance_creation

import 'package:flutter_repository/src/app.dart';
import 'package:flutter_repository/src/app/bloc/verify_sms_code/verify_sms_code_bloc.dart';
import 'package:flutter_repository/src/app/util/size.dart';
import 'package:flutter_repository/src/app/view/page/registration/registration.dart';
import 'package:flutter_repository/src/app/view/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_repository/src/app/view/widget/input_text.dart';

class Verifotp extends StatelessWidget {
  const Verifotp({super.key});
  static Route<bool?> route() {
    return MaterialPageRoute(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => VerifyQueryBloc()),
        ],
        child: const Verifotp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            bottomNavigationBar: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
            ),
            body: ListView(
              children: [
                SafeArea(
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: paddingHorizontalPage,
                          ),
                          child: const SizedBox(height: 10 * 2),
                        ),
                        // const RegistrasiForm(),
                        const SizedBox(height: 80),
                        const Content(),
                        const SizedBox(height: 40),
                        Forms(),
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: paddingHorizontalPage,
                          ),
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "Done have an account?",
                                style: TextStyle(fontFamily: 'Montserrat', fontSize: 14),
                              ),
                              InkWell(
                                child: const Text(
                                  "SignUp?",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  Navigator.push(context, Registration.route());
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/img/user.png',
      width: 100,
    );
  }
}

class Forms extends StatelessWidget {
  Forms({super.key});
  final _formKeys = GlobalKey<FormState>();
  final _requiredValidator = RequiredValidator(errorText: 'username is required');
  final _requiredPasswordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(6, errorText: 'password minimal 6 karakter'),
  ]);
  final _nipLoginController = TextEditingController();
  final _passwordLoginController = TextEditingController();

  void _submit(BuildContext context) {
    final otpBloc = BlocProvider.of<VerifyQueryBloc>(context);
    if (_formKeys.currentState?.validate() ?? false) {
      otpBloc.add(
        VerifyQueryGet(
          nip: _nipLoginController.text,
          password: _passwordLoginController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyQueryBloc, VerifyQueryState>(
      listener: (context, state) {
        if (state.status.isInProgress) {
          EasyLoading.show(
            status: 'loading..',
            maskType: EasyLoadingMaskType.black,
            // dismissOnTap: true,
          );
          EasyLoading.dismiss();
        } else if (state.status.isSuccess) {
          // EasyLoading.dismiss();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const App(),
            ),
          );
        } else if (state.status.isFailure) {
          EasyLoading.dismiss();
          EasyLoading.showError('Username or password is incorrect');
        }
      },
      child: Form(
        key: _formKeys,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: InputText(
                  // isNumber: false,
                  label: 'Username',
                  validator: _requiredValidator,
                  controller: _nipLoginController,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: InputText(
                  // isNumber: false,
                  label: 'Password',
                  validator: _requiredPasswordValidator,
                  controller: _passwordLoginController,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: const Text(
                      "Forgot password? ",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontFamily: 'Montserrat', fontSize: 14),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Button(
                onPressed: () {
                  _submit(context);
                },
                child: const Text(
                  'Login',
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
