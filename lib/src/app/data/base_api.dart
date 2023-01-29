import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BaseApi {
  static const timeout = 60;
  final baseUrl = 'https://gateway.broiler.voltunes.com/';
  final dio = Dio();
  Future<Map<String, dynamic>> request(
    String url, {
    required Map<String, String> headers,
    bool isFormData = false,
    Map<String, dynamic>? body,
    String method = 'GET',
  }) async {
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    late Response<dynamic> response;
    final options = Options(headers: headers);
    const timeLimit = Duration(seconds: timeout);
    final formData =
        isFormData ? FormData.fromMap(body ?? {}) : jsonEncode(body);
    try {
      switch (method) {
        case 'GET':
          response = await dio
              .get<dynamic>(url, options: options)
              .timeout(timeLimit, onTimeout: _onTimeout);
          break;
        case 'POST':
          response = await dio
              .post<dynamic>(url, data: formData, options: options)
              .timeout(timeLimit, onTimeout: _onTimeout);
          break;
        case 'DELETE':
          response = await dio
              .delete<dynamic>(url, data: formData, options: options)
              .timeout(timeLimit, onTimeout: _onTimeout);
          break;
        case 'PATCH':
          response = await dio
              .patch<dynamic>(url, data: formData, options: options)
              .timeout(timeLimit, onTimeout: _onTimeout);
          break;
        case 'PUT':
          response = await dio
              .put<dynamic>(url, data: formData, options: options)
              .timeout(timeLimit, onTimeout: _onTimeout);
          break;
        default:
      }
      try {
        final result = response.data == String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : response.data as Map<String, dynamic>;
        return result;
      } catch (e) {
        return {};
      }
    } on DioError catch (e) {
      if (e.response == null) {
        throw PlatformException(
          code: 'ERROR_CONNECTION_REFUSED',
          message: e.message,
        );
      }
      final response = e.response?.data as Map<String, dynamic>?;
      var message = '';
      if (response?.containsKey('message') ?? false) {
        message = response!['message'] as String;
      }
      if (e.response?.statusCode == 401) {
        throw PlatformException(code: 'ERROR_UNAUTHORIZED', message: message);
      } else {
        throw PlatformException(
          code: 'ERROR_INTERNAL_SERVER',
          message: message,
        );
      }
    }
  }

  Future<Response<dynamic>> _onTimeout() {
    throw PlatformException(code: 'TIMEOUT', message: 'Timeout during request');
  }
}
