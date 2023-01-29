// ignore_for_file: lines_longer_than_80_chars, avoid_dynamic_calls

import 'dart:convert';

import 'dart:io';

import 'package:flutter_repository/src/app/data/sign_in_base_api.dart';

final apiProvider = ApiProviderOtp();

class ApiProviderOtp extends BaseApiOtp {
  Future<void> otps({
    required String phoneNumber,
    required String token,
  }) async {
    const url = 'http://localhost:8080/users/login';
    final auth = '$phoneNumber:';
    await request(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Basic ${base64Encode(utf8.encode(auth))}'},
    );
  }

  Future<String> logIn({
    required String nip,
    required String password,
  }) async {
    const url = 'http://localhost:8080/users/login';
    final auth = '$nip:$password';
    final response = await request(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Basic ${base64Encode(utf8.encode(auth))}'},
    );
    return response['data']['access_token'] as String;
  }
}
