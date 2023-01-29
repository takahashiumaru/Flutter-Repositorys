import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_repository/constant/bloc_status.dart';
import 'package:flutter_repository/src/app/data/users_api_provider.dart';
import 'package:flutter_repository/src/app/model/users.dart' as model;
import 'package:flutter_repository/src/app/model/user_respository.dart';
import 'package:meta/meta.dart';

part 'users_query_event.dart';
part 'users_query_state.dart';

class UserQueryBloc extends Bloc<UserQueryEvent, UserQueryState> {
  UserQueryBloc() : super(const UserQueryState()) {
    on<UserQueryGet>(_getData);
  }

  final _apiProvider = ApiProvider();

  Future<void> _getData(
    UserQueryGet event,
    Emitter<UserQueryState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatus.inProgress));
    try {
      final users = await _apiProvider.users(token: userRepository.token);
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
