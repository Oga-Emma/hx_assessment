import 'package:hagglex/data/local/service/cache_service.dart';
import 'package:hagglex/data/remote/repository/auth_repo.dart';
import 'package:hagglex/data/remote/service/auth_service.dart';

class AuthServiceImpl implements AuthService {
  final AuthRepo authRepo;
  final CacheService cache;
  AuthServiceImpl({this.cache, this.authRepo});

  @override
  Future login(String email, String password) {
    return authRepo.login(email, password);
  }
}
