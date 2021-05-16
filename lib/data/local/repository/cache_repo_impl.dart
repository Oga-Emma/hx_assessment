import 'dart:convert';

import 'package:hagglex/data/local/repository/cache_repo.dart';
import 'package:hagglex/model/podo/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheRepoImpl implements CacheRepo {
  SharedPreferences preferences;
  CacheRepoImpl({this.preferences});

  @override
  Future<String> getToken() async {
    return preferences.getString('token');
  }

  @override
  Future<User> getUser() async {
    if (!preferences.containsKey('user')) {
      throw Exception("user not found");
    }
    return User.fromMap(json.decode(preferences.getString('user')));
  }

  @override
  Future saveToken(token) {
    return preferences.setString('token', token);
  }

  @override
  Future saveUser(User user) {
    return preferences.setString('user', json.encode(user.toMap()));
  }

  @override
  Future clearAll() {
    return preferences.clear();
  }
}
