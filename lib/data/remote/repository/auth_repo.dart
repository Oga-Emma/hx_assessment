import 'package:hagglex/model/podo/auth_response.dart';

abstract class AuthRepo {
  Future<AuthResponse> login(String email, String password);
  Future<AuthResponse> register(Map<String, dynamic> data);
  Future<AuthResponse> verifyUser(String token, String code);
}
