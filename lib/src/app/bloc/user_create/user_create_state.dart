part of 'user_create_bloc.dart';

@immutable
abstract class UserCreateState {}

class UserCreateInitial extends UserCreateState {}

class UserCreateInProgress extends UserCreateState {}

class UserCreateSuccess extends UserCreateState {
  UserCreateSuccess();
}

class UserCreateFailure extends UserCreateState {
  UserCreateFailure({this.messageText = 'Failure'});
  final String messageText;
}
