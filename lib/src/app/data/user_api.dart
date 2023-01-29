import 'dart:io';

import 'package:flutter_repository/src/app/data/user_api_base.dart';

import 'package:flutter_repository/src/app/model/user.dart';

final apiProvider = UserApiProvider();

class UserApiProvider extends UserBaseApi {
  Future<List<User>> employee({
    required String token,
  }) async {
    final url = '$gatewayBaseUrl/users';
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

  Future<Map<String, dynamic>> employeeCreate({
    required String token,
    required String name,
    required String phone,
    required String role,
  }) async {
    final url = '$gatewayBaseUrl/users';
    return request(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      method: 'POST',
      body: {
        'name': name,
        'phone': phone,
        'role': role,
      },
    );
  }

  Future<void> employeeDelete({
    required String token,
    required int id,
  }) async {
    final url = '$gatewayBaseUrl/users/$id';
    await request(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      method: 'DELETE',
    );
  }

  Future<Map<String, dynamic>> employeeUpdate({
    required String token,
    required int id,
    required String name,
    required String phone,
    required String role,
  }) async {
    final url = '$gatewayBaseUrl/users/$id';
    return request(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      method: 'PUT',
      body: {
        'id': id,
        'name': name,
        'phone': phone,
        'role': role,
      },
    );
  }
}
