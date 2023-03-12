part of 'registration_create_bloc.dart';

@immutable
abstract class RegistrationEvent {}

class RegistrationSubmitCreate extends RegistrationEvent {
  RegistrationSubmitCreate(
      {required this.name,
      required this.nip,
      required this.email,
      required this.password,
      required this.phone,
      required this.role,
      required this.joinDate});
  final String name;
  final int nip;
  final String email;
  final String password;
  final String phone;
  final String role;
  final String joinDate;
}
