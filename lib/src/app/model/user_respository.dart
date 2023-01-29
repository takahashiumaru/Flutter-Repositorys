// ignore_for_file: must_be_immutable, flutter_style_todos

import 'dart:convert';

import 'package:flutter_repository/src/app/model/user_model.dart';

class UserRepository {
  late User user;
  late String token;

  void setUser(String token) {
    final tokenSplited = token.split('.')[1];
    final data = jsonDecode(
      utf8.decode(
        base64Decode(
          base64.normalize(tokenSplited),
        ),
      ),
    ) as Map<String, dynamic>;
    this.token = token;
    user = User(
      id: data['id'] as int,
      name: data['name'] as String,
      level: data['level'] as String,
      nip: data['nip'] as String,
      role: data['role'] as String,
    );
  }

  void logoutUser() {
    token = '';
    user = User(
      id: 0,
      name: '',
      role: '',
      level: '',
      nip: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': user,
    };
  }
}

UserRepository userRepository = UserRepository();
