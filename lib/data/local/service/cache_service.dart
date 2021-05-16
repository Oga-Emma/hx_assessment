import 'package:hagglex/model/podo/user.dart';

abstract class CacheService {
  Future saveUser(User user);
  Future<User> getUser();

  Future saveToken(token);
  Future<String> getToken();

  Future clearCache();
}
