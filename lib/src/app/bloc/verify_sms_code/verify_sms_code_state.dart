part of 'verify_sms_code_bloc.dart';

@immutable
class VerifyQueryState {
  const VerifyQueryState({
    this.nip = const [],
    this.password = const [],
    this.status = BlocStatus.initial,
  });
  final List<model.User> nip;
  final List<model.User> password;
  final BlocStatus status;

  VerifyQueryState copyWith({
    List<model.User>? nip,
    List<model.User>? password,
    BlocStatus? status,
  }) {
    return VerifyQueryState(
      nip: nip ?? this.nip,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  VerifyQueryState unsetCustomerOverview({
    List<model.User>? nip,
    List<model.User>? password,
    BlocStatus? status,
  }) {
    return VerifyQueryState(
      nip: nip ?? this.nip,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
