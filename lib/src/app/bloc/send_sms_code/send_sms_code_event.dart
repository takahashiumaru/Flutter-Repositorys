part of 'send_sms_code_bloc.dart';

@immutable
abstract class SmsQueryEvent {}

class SmsQueryGet extends SmsQueryEvent {

  SmsQueryGet({
    required this.numberPhone,
  });
  final String numberPhone;
}

class SmsQuerySaveNum extends SmsQueryEvent {

  SmsQuerySaveNum({
    required this.numberPhone,
  });
  final String numberPhone;
}
