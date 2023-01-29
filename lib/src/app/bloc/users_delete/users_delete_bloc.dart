// ignore_for_file: strict_raw_type, lines_longer_than_80_chars

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_repository/src/app/data/users_api_provider.dart';

import 'package:flutter_repository/src/app/model/users.dart' as model;
import 'package:flutter_repository/src/app/model/user_respository.dart';
import 'package:meta/meta.dart';

part 'users_delete_event.dart';
part 'users_delete_state.dart';

class UsersDeleteBloc extends Bloc<UsersDeleteEvent, UsersDeleteState> {
  UsersDeleteBloc() : super(UsersDeleteInitial()) {
    on<UsersDeleteSubmit>(_submit);
  }

  final _apiProvider = ApiProvider();

  Future _submit(UsersDeleteSubmit event, Emitter<UsersDeleteState> emit) async {
    emit(UsersDeleteInProgress());
    try {
      await _apiProvider.usersDelete(
        token: userRepository.token,
        usersId: event.user.id,
      );
      emit(UsersDeleteSuccess());
    } catch (e) {
      emit(UsersDeleteFailure());
    }
  }
}
