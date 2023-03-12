import 'dart:io';

import 'package:flutter_repository/src/app/data/gateway_base_api.dart';
import 'package:flutter_repository/src/app/model/users.dart';

final apiProvider = ApiProvider();

class ApiProvider extends BaseApi {
  Future<List<Users>> users({
    required String token,
  }) async {
    // ignore: unnecessary_brace_in_string_interps
    final url = '${baseUrl}/users';
    final response = await request(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    final users = <Users>[];
    for (final user in response['data'] as List) {
      users.add(Users.fromJson(user as Map<String, dynamic>));
    }
    return users;
  }

  Future<void> usersDelete({
    required String token,
    required int usersId,
  }) async {
    final url = '$baseUrl/users/$usersId';
    await request(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      method: 'DELETE',
    );
  }

  Future<Map<String, dynamic>> productCreate({
    required String token,
    required String name,
    // ignore: non_constant_identifier_names
    required int product_category_id,
    // ignore: non_constant_identifier_names
    required int product_company_id,
  }) async {
    // ignore: unnecessary_brace_in_string_interps
    final url = '${baseUrl}products';
    final response = await request(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      method: 'POST',
      body: {
        'name': name,
        'product_category_id': product_category_id,
        'product_company_id': product_company_id,
      },
    );
    return response;
  }

  Future<Map<String, dynamic>> productUpdate({
    required int productId,
    required String name,
    required String token,
    // ignore: non_constant_identifier_names
    required int product_category_id,
    // ignore: non_constant_identifier_names
    required int product_company_id,
  }) async {
    final url = '${baseUrl}products/$productId';
    return request(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      method: 'PUT',
      body: {
        'name': name,
        'product_category_id': product_category_id,
        'product_company_id': product_company_id,
      },
    );
  }
}
