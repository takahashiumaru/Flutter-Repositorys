part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}
