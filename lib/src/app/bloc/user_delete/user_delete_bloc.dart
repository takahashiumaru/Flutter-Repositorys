// ignore_for_file: strict_raw_type, lines_longer_than_80_chars

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_repository/src/app/data/user_api.dart';

import 'package:flutter_repository/src/app/model/user.dart' as model;
import 'package:flutter_repository/src/app/model/user_respository.dart';
import 'package:meta/meta.dart';

part 'user_delete_event.dart';
part 'user_delete_state.dart';

class UserDeleteBloc extends Bloc<UserDeleteEvent, UserDeleteState> {
  UserDeleteBloc() : super(UserDeleteInitial()) {
    on<UserDeleteSubmit>(_submit);
  }

  final _apiProvider = UserApiProvider();

  Future _submit(UserDeleteSubmit event, Emitter<UserDeleteState> emit) async {
    emit(UserDeleteInProgress());
    try {
      await _apiProvider.employeeDelete(
        token: userRepository.token,
        id: event.user.id,
      );
      emit(UserDeleteSuccess());
    } catch (e) {
      emit(UserDeleteFailure());
    }
  }
}
