part of 'user_create_bloc.dart';

@immutable
abstract class UserCreateEvent {}

class UserCreateSubmitCreate extends UserCreateEvent {

  UserCreateSubmitCreate({
    required this.name,
    required this.role,
    required this.phone,
  });
  final String name;
  final String role;
  final String phone;
}

class UserCreateSubmitUpdate extends UserCreateEvent {

  UserCreateSubmitUpdate({
    required this.id,
    required this.name,
    required this.role,
    required this.phone,
  });
  final int id;
  final String name;
  final String role;
  final String phone;
}
