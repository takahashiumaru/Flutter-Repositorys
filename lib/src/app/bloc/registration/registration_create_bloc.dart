// ignore_for_file: strict_raw_type, lines_longer_than_80_chars

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_repository/constant/text.dart';
import 'package:flutter_repository/src/app/data/registration_api.dart';
import 'package:flutter_repository/src/app/model/user_respository.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
part 'registration_create_event.dart';
part 'registratin_create_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<RegistrationSubmitCreate>(_submitcreate);
    // on<RegistrationSubmitUpdate>(_submitupdate);
  }

  final _apiProvider = UserApiProvider();

  Future _submitcreate(
    RegistrationSubmitCreate event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(RegistrationInProgress());
    try {
      await _apiProvider.registration(
        name: event.name,
        nip: event.nip,
        email: event.email,
        password: event.password,
        phone: event.phone,
        role: event.role,
        joinDate: event.joinDate,
      );

      emit(RegistrationSuccess());
    } on PlatformException catch (e) {
      emit(RegistrationFailure(messageText: e.message ?? error));
    } catch (e) {
      emit(RegistrationFailure());
    }
  }
}
