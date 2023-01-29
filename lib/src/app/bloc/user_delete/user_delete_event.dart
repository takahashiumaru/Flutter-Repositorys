part of 'user_delete_bloc.dart';

@immutable
abstract class UserDeleteEvent {}

class UserDeleteSubmit extends UserDeleteEvent {

  UserDeleteSubmit(this.user);
  final model.User user;
}
