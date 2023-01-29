// ignore_for_file: unused_element, lines_longer_than_80_chars

import 'package:flutter_repository/src/app/bloc/registration/registration_create_bloc.dart';
import 'package:flutter_repository/src/app/model/user.dart';
import 'package:flutter_repository/src/app/util/size.dart';
import 'package:flutter_repository/src/app/util/toast.dart';
import 'package:flutter_repository/src/app/view/widget/button.dart';
import 'package:flutter_repository/src/app/view/widget/input_text.dart';
import 'package:flutter_repository/src/app/view/widget/input_text_verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  static Route<bool?> route() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => RegistrationBloc(),
        child: Registration(),
      ),
    );
  }

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
        title: const Text('Registration'),
      ),
      body: _Form(),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({
    super.key,
    this.user,
  });

  final User? user;

  @override
  State<_Form> createState() => _FormState();
}

DateTime now = DateTime.now();
var dateTimeNow = now.year.toString() + now.month.toString() + now.day.toString();
var role = "USER";

class _FormState extends State<_Form> {
  final _formKey = GlobalKey<FormState>();
  final _requiredValidator = RequiredValidator(errorText: 'This field is required');
  final _nameController = TextEditingController();
  final _nipController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      _nameController.text = widget.user!.name;
      _nipController.text = widget.user!.role;
      _emailController.text = widget.user!.role;
      _passwordController.text = widget.user!.role;
      _phoneController.text = widget.user!.phone;
    }
  }

  void _submit(BuildContext context) {
    final registration = BlocProvider.of<RegistrationBloc>(context);
    if (_formKey.currentState?.validate() ?? false) {
      registration.add(
        RegistrationSubmitCreate(
          name: _nameController.text,
          nip: _nipController.text,
          email: _emailController.text,
          password: _passwordController.text,
          phone: _phoneController.text,
          role: role,
          joinDate: dateTimeNow,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (state is RegistrationSuccess) {
          Toast(context).success(
            'Registations Successfully',
          );
          Navigator.pop(context, true);
        }
        if (state is RegistrationFailure) {
          Toast(context).fail(state.messageText);
        }
      },
      child: Form(
        key: _formKey,
        child: ListView(
          // padding: const EdgeInsets.symmetric(
          //   horizontal: paddingHorizontalPage,
          //   vertical: 20,
          // ),
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          children: [
            const SizedBox(height: 10),
            InputText(
              label: 'Name',
              validator: _requiredValidator,
              controller: _nameController,
            ),
            const SizedBox(height: 10),
            InputText(
              // isNumber: true,
              label: 'Nip',
              validator: _requiredValidator,
              controller: _nipController,
            ),
            const SizedBox(height: 10),
            InputText(
              label: 'No Handphone',
              validator: _requiredValidator,
              controller: _phoneController,
            ),
            const SizedBox(height: 10),
            InputText(
              label: 'Email',
              validator: _requiredValidator,
              controller: _emailController,
            ),
            const SizedBox(height: 10),
            InputText(
              label: 'Password',
              validator: _requiredValidator,
              controller: _passwordController,
            ),
            const SizedBox(height: 30),
            Button(
              onPressed: () => _submit(context),
              child: const Text(
                'Save',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
