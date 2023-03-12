// ignore_for_file: strict_raw_type, lines_longer_than_80_chars, depend_on_referenced_packages

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_repository/constant/text.dart';
import 'package:flutter_repository/src/app/data/user_api.dart';
import 'package:flutter_repository/src/app/model/user_respository.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
part 'user_create_event.dart';
part 'user_create_state.dart';

class UserCreateBloc extends Bloc<UserCreateEvent, UserCreateState> {
  UserCreateBloc() : super(UserCreateInitial()) {
    on<UserCreateSubmitCreate>(_submitcreate);
    on<UserCreateSubmitUpdate>(_submitupdate);
  }

  final _apiProvider = UserApiProvider();

  Future _submitcreate(
    UserCreateSubmitCreate event,
    Emitter<UserCreateState> emit,
  ) async {
    emit(UserCreateInProgress());
    try {
      await _apiProvider.employeeCreate(
        token: userRepository.token,
        name: event.name,
        role: event.role,
        phone: event.phone,
      );

      emit(UserCreateSuccess());
    } on PlatformException catch (e) {
      emit(UserCreateFailure(messageText: e.message ?? error));
    } catch (e) {
      emit(UserCreateFailure());
    }
  }

  Future _submitupdate(
    UserCreateSubmitUpdate event,
    Emitter<UserCreateState> emit,
  ) async {
    emit(UserCreateInProgress());
    try {
      await _apiProvider.employeeUpdate(
        token: userRepository.token,
        id: event.id,
        name: event.name,
        role: event.role,
        phone: event.phone,
      );

      emit(UserCreateSuccess());
    } on PlatformException catch (e) {
      emit(UserCreateFailure(messageText: e.message ?? error));
    } catch (e) {
      emit(UserCreateFailure());
    }
  }
}
