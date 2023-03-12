import 'package:flutter_repository/src/app/data/registration_api_base.dart';

final apiProvider = UserApiProvider();

class UserApiProvider extends UserBaseApi {
  Future<Map<String, dynamic>> registration({
    required String name,
    required int nip,
    required String password,
    required String email,
    required String phone,
    required String role,
    required String joinDate,
  }) async {
    final url = '$gatewayBaseUrl/users/registration';
    return request(
      url,
      method: 'POST',
      body: {
        'name': name,
        'nip': nip,
        'password': password,
        'email': email,
        'phone': phone,
        'role': role,
        'join_date': joinDate,
      },
    );
  }
}
