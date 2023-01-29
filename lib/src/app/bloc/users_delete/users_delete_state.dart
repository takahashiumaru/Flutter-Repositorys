part of 'users_delete_bloc.dart';

@immutable
abstract class UsersDeleteState {}

class UsersDeleteInitial extends UsersDeleteState {}

class UsersDeleteInProgress extends UsersDeleteState {}

class UsersDeleteSuccess extends UsersDeleteState {
  UsersDeleteSuccess();
}

class UsersDeleteFailure extends UsersDeleteState {
  UsersDeleteFailure({this.messageText = 'Failure'});
  final String messageText;
}
