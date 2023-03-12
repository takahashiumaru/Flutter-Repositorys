// ignore_for_file: strict_raw_type, lines_longer_than_80_chars, depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
// import 'package:user_repository/user_repository.dart';

import 'package:flutter_repository/constant/bloc_status.dart';
import 'package:flutter_repository/src/app/data/user_api.dart';
import 'package:flutter_repository/src/app/model/user.dart' as model;
import 'package:flutter_repository/src/app/model/user_respository.dart';
import 'package:meta/meta.dart';

part 'user_query_event.dart';
part 'user_query_state.dart';

class UserQueryBloc extends Bloc<CustomerQueryEvent, UserQueryState> {
  UserQueryBloc() : super(const UserQueryState()) {
    on<UserQueryGet>(_getData);
  }

  final _apiProvider = UserApiProvider();

  Future _getData(UserQueryGet event, Emitter<UserQueryState> emit) async {
    emit(state.copyWith(status: BlocStatus.inProgress));
    try {
      final users = await _apiProvider.employee(
        token: userRepository.token,
      );
      emit(
        state.copyWith(
          status: BlocStatus.success,
          users: users,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatus.failure,
          users: [],
        ),
      );
    }
  }
}
