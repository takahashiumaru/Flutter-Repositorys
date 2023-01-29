import 'dart:io';

import 'package:flutter_repository/src/app/data/base_api_old.dart';
import 'package:flutter_repository/src/app/model/user.dart';

/// Creating an instance of the ApiProvider class.
final apiProvider = ApiProvider();

class ApiProvider extends BaseApi {
  Future<String> login(String username, String password) async {
    // final url = '${baseUrl}users/login';
    // final auth = '$username:$password';
    // return request(
    //   url,
    //   headers: {HttpHeaders.authorizationHeader: 'Basic ${base64Encode(utf8.encode(auth))}'},
    // );

    return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3NfdXVpZCI6ImUyZWNlMzRiLTAxYzUtNDg5OS05MjY3LTA3MDJjN2YzYjkzMSIsImF1dGhvcml6ZWQiOnRydWUsImNvbXBhbnkiOiJWTkVVIiwiZXhwIjoxNjU1ODgxNzIzLCJpZCI6IlwiZDU5ODI0ZTEtNjUyZi00MDZjLTllY2YtMTY4MTVkZDA5ZTlhXCIiLCJuYW1lIjoibnVudW5nIHBhbXVuZ2thcyIsInBob25lIjoiNjI4MTE5MDAzMDc3IiwicGljdHVyZSI6Imh0dHBzOi8vYXBpLmRhdGF0YWdzLmlvL3N0YXRpYy9mZW1hbGVfYXZhdGFyLnN2ZyIsInJvbGUiOiIwIn0.YCJ0bV_4uI6YFBSBmUjYG1M1IF5LzCIXu1gfiWNlsdA';
  }

  Future<List<User>> users({
    required String token,
  }) async {
    final url = '${baseUrl}api/users';
    final response = await request(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    final users = <User>[];
    for (final user in response['data'] as List) {
      users.add(User.fromJson(user as Map<String, dynamic>));
    }
    return users;
  }

  Future<void> userDelete({
    required String token,
    required int userId,
  }) async {
    final url = '${baseUrl}api/users/$userId';
    await request(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      method: 'DELETE',
    );
  }

  Future<Map<String, dynamic>> userCreate({
    required String token,
    required String name,
    required String job,
  }) async {
    final url = '${baseUrl}api/users';
    return request(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      method: 'POST',
      body: {
        'name': name,
        'job': job,
      },
    );
  }

  Future<Map<String, dynamic>> userUpdate({
    required int userId,
    required String job,
    required String name,
    required String token,
  }) async {
    final url = '${baseUrl}api/users/$userId';
    return request(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      method: 'POST',
      body: {
        'name': name,
        'job': job,
      },
    );
  }
}
