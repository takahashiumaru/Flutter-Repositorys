// ignore_for_file: must_be_immutable

part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AuthenticationSignIn extends AuthenticationEvent {}

class AuthenticationSignOut extends AuthenticationEvent {}
