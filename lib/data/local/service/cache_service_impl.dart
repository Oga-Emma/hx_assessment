import 'package:hagglex/data/local/repository/cache_repo.dart';
import 'package:hagglex/data/local/service/cache_service.dart';

class CacheServiceImpl implements CacheService {
  CacheRepo cacheRepo;
  CacheServiceImpl({this.cacheRepo});
}
