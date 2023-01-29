part of 'registration_create_bloc.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationInProgress extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {
  RegistrationSuccess();
}

class RegistrationFailure extends RegistrationState {
  RegistrationFailure({this.messageText = 'Failure'});
  final String messageText;
}
