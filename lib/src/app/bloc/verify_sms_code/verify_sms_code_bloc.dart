// ignore_for_file: unused_local_variable, strict_raw_type

import 'package:bloc/bloc.dart';
import 'package:flutter_repository/constant/bloc_status.dart';
import 'package:flutter_repository/src/app/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_repository/src/app/data/sign_in_api.dart';
import 'package:flutter_repository/src/app/model/User.dart' as model;
import 'package:flutter_repository/src/app/model/user_respository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'verify_sms_code_event.dart';
part 'verify_sms_code_state.dart';

class VerifyQueryBloc extends Bloc<VerifyQueryEvent, VerifyQueryState> {
  VerifyQueryBloc() : super(const VerifyQueryState()) {
    on<VerifyQueryGet>(_getData);
  }

  final _apiProvider = ApiProviderOtp();

  Future _getData(VerifyQueryGet event, Emitter<VerifyQueryState> emit) async {
    emit(state.copyWith(status: BlocStatus.inProgress));
    try {
      final token = await _apiProvider.logIn(
        nip: event.nip,
        password: event.password,
      );
      userRepository.setUser(token);
      authenticationBloc.add(AuthenticationSignIn());
      emit(state.copyWith(status: BlocStatus.success));
      // _authenticationRepository.logIn();
    } catch (e) {
      emit(state.copyWith(status: BlocStatus.failure));
    }
  }
}
