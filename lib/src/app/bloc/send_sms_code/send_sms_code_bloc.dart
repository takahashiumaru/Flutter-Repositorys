// ignore_for_file: strict_raw_type

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_repository/constant/bloc_status.dart';
import 'package:flutter_repository/src/app/data/sign_in_api.dart';
import 'package:meta/meta.dart';

part 'send_sms_code_event.dart';
part 'send_sms_code_state.dart';

class SmsQueryBloc extends Bloc<SmsQueryEvent, SmsQueryState> {
  SmsQueryBloc() : super(const SmsQueryState()) {
    on<SmsQueryGet>(_getData);
    on<SmsQuerySaveNum>(
      (event, emit) {
        emit(
          state.copyWith(
            numbers: List.from(state.numbers)..add(event.numberPhone),
          ),
        );
      },
    );
  }

  final _apiProvider = ApiProviderOtp();

  Future _getData(SmsQueryGet event, Emitter<SmsQueryState> emit) async {
    emit(state.copyWith(status: BlocStatus.inProgress));
    try {
      await _apiProvider.otps(
        token: '',
        phoneNumber: event.numberPhone,
      );
      emit(
        state.copyWith(
          status: BlocStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatus.failure,
        ),
      );
    }
  }
}
