part of 'send_sms_code_bloc.dart';

@immutable
class SmsQueryState {

  const SmsQueryState({
    this.numbers = const [],
    this.status = BlocStatus.initial,
  });
  final List<String> numbers;
  final BlocStatus status;

  SmsQueryState copyWith({
    List<String>? numbers,
    BlocStatus? status,
  }) {
    return SmsQueryState(
      numbers: numbers ?? this.numbers,
      status: status ?? this.status,
    );
  }

  SmsQueryState unsetCustomerOverview({
    List<String>? numbers,
    BlocStatus? status,
  }) {
    return SmsQueryState(
      numbers: numbers ?? this.numbers,
      status: status ?? this.status,
    );
  }
}
