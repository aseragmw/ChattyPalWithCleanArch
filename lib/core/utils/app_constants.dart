
import 'package:ChattyPal/core/utils/cache_manager.dart';

class AppConstants {
  static late bool? userIsLoggedIn;
  static late String? userName;
  static late String? userId;
  static late String? userEmail;
  static late String? userPassword;
  static late String? userProfileImgUrl;
  static late String? userBio;

  static void initAppConstants() async {
    userName = await CacheManager.getValue(userNameCacheKey);
    userId = await CacheManager.getValue(userIdCacheKey);
    userIsLoggedIn = await CacheManager.getValue(userIsLoggedInCacheKey);
    userEmail = await CacheManager.getValue(userEmailCacheKey);
    userPassword = await CacheManager.getValue(userPasswordCacheKey);
    userProfileImgUrl = await CacheManager.getValue(userProfileImgUrlCacheKey);
    userBio = await CacheManager.getValue(userBioCacheKey);
  }
}


const userIsLoggedInCacheKey = 'userIsLoggedIn';
const userNameCacheKey = 'userName';
const userIdCacheKey = 'userId';
const userEmailCacheKey = 'userEmail';
const userPasswordCacheKey = 'password';
const userProfileImgUrlCacheKey = 'userProfileImgUrl';
const userBioCacheKey = 'userBio';
