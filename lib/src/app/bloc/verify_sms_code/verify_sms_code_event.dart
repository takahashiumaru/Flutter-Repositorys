part of 'verify_sms_code_bloc.dart';

@immutable
abstract class VerifyQueryEvent {}

class VerifyQueryGet extends VerifyQueryEvent {
  VerifyQueryGet({
    required this.nip,
    required this.password,
  });
  final String nip;
  final String password;
}
