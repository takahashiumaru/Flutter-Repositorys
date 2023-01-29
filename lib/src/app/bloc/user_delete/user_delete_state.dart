part of 'user_delete_bloc.dart';

@immutable
abstract class UserDeleteState {}

class UserDeleteInitial extends UserDeleteState {}

class UserDeleteInProgress extends UserDeleteState {}

class UserDeleteSuccess extends UserDeleteState {
  UserDeleteSuccess();
}

class UserDeleteFailure extends UserDeleteState {
  UserDeleteFailure({this.messageText = 'Failure'});
  final String messageText;
}
