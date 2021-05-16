import 'package:hagglex/data/local/service/cache_service.dart';
import 'package:hagglex/data/remote/repository/auth_repo.dart';
import 'package:hagglex/data/remote/service/auth_service.dart';
import 'package:hagglex/model/podo/auth_response.dart';
import 'package:hagglex/model/podo/user.dart';

class AuthServiceImpl implements AuthService {
  final AuthRepo authRepo;
  final CacheService cache;
  AuthServiceImpl({this.cache, this.authRepo});

  @override
  Future<AuthResponse> login(String email, String password) async {
    var res = await authRepo.login(email, password);
    if (!res.twoFactorAuth) {
      saveToCache(res);
    }
    return res;
  }

  @override
  Future<User> register(Map<dynamic, dynamic> data) async {
    var response = await authRepo.register(data);
    saveToCache(response);
    return response.user;
  }

  @override
  Future<User> verifyUser(String code) async {
    var response = await authRepo.verifyUser(await cache.getToken(), code);
    saveToCache(response);
    return response.user;
  }

  saveToCache(AuthResponse response) {
    cache.saveUser(response.user);
    cache.saveToken(response.token);
  }
}
