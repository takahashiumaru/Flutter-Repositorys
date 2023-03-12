// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter_repository/src/app/model/user_respository.dart';

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends HydratedBloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationUnauthenticated()) {
    on<AuthenticationSignIn>(
      (event, emit) => emit(
        AuthenticationAuthenticated(),
      ),
    );

    on<AuthenticationSignOut>(
      (event, emit) => emit(
        AuthenticationUnauthenticated(),
      ),
    );
  }

  @override
  AuthenticationState fromJson(Map<String, dynamic> json) {
    try {
      if (json.containsKey('token') && json['token'] != '') {
        userRepository.setUser(json['token'] as String);
        return AuthenticationAuthenticated();
      } else {
        return AuthenticationUnauthenticated();
      }
    } catch (e) {
      return AuthenticationUnauthenticated();
    }
  }

  @override
  Map<String, dynamic> toJson(AuthenticationState state) {
    if (state is AuthenticationAuthenticated) {
      return {'token': userRepository.token};
    } else {
      return {'token': ''};
    }
  }
}

final authenticationBloc = AuthenticationBloc();
