part of 'users_delete_bloc.dart';

@immutable
abstract class UsersDeleteEvent {}

class UsersDeleteSubmit extends UsersDeleteEvent {
  UsersDeleteSubmit(this.user);
  final model.Users user;
}
