import 'package:hagglex/model/podo/auth_response.dart';
import 'package:hagglex/model/podo/user.dart';

abstract class AuthService {
  Future<AuthResponse> login(String email, String password);
  Future<User> register(Map<dynamic, dynamic> data);
}
