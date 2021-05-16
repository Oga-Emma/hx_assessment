import 'package:hagglex/data/local/repository/cache_repo.dart';
import 'package:hagglex/data/local/service/cache_service.dart';
import 'package:hagglex/model/podo/user.dart';

class CacheServiceImpl implements CacheService {
  CacheRepo cacheRepo;
  CacheServiceImpl({this.cacheRepo});

  @override
  Future<String> getToken() {
    return cacheRepo.getToken();
  }

  @override
  Future<User> getUser() {
    return cacheRepo.getUser();
  }

  @override
  Future saveToken(token) {
    return cacheRepo.saveToken(token);
  }

  @override
  Future saveUser(User user) {
    return cacheRepo.saveUser(user);
  }

  @override
  Future clearCache() {
    return cacheRepo.clearAll();
  }
}
