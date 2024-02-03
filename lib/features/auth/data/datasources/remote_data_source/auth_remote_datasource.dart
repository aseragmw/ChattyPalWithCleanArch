import 'dart:developer';

import 'package:chatty_pal/core/utils/app_constants.dart';
import 'package:chatty_pal/core/utils/cache_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<Unit> login(String email, String password);
  Future<UserCredential> register(String name, String email, String password);
  Future<Unit> logout();
  Future<Unit> updateUserDisplayName(String name);
  Future<Unit> updateUserEmail(String email);
  Future<Unit> updateUserPassword(String password);
}

class AuthRemoteDataSourceImplWithFirebase extends AuthRemoteDataSource {
  static final firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Unit> login(String email, String password) async {
    try {
      final signInResult = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (signInResult.user != null) {
        //log(' this is ${signInResult.user!.photoURL.toString()}');
        // CacheManager.setValue(userIsLoggedInCacheKey, true);
        // CacheManager.setValue(userNameCacheKey, signInResult.user!.displayName);
        // CacheManager.setValue(userIdCacheKey, signInResult.user!.uid);
        // CacheManager.setValue(userEmailCacheKey, signInResult.user!.email);
        // CacheManager.setValue(userProfileImgUrlCacheKey, signInResult.user!.photoURL);
        // CacheManager.setValue(userPasswordCacheKey, password);
        // AppConstants.userIsLoggedIn = true;
        // AppConstants.userName = signInResult.user!.displayName!;
        // AppConstants.userId = signInResult.user!.uid;
        // AppConstants.userEmail = signInResult.user!.email!;
        // AppConstants.userPassword = password;
        // AppConstants.userProfileImgUrl = signInResult.user!.photoURL;
        log('akher login function');
        return unit;
      } else {
        log('hena 1');
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
      throw Exception();
    }
  }

  @override
  Future<Unit> logout() async {
    await firebaseAuth.signOut();
    CacheManager.setValue(userIsLoggedInCacheKey, false);
    CacheManager.setValue(userNameCacheKey, '');
    CacheManager.setValue(userIdCacheKey, '');
    CacheManager.setValue(userEmailCacheKey, '');
    CacheManager.setValue(userProfileImgUrlCacheKey, '');
    CacheManager.setValue(userPasswordCacheKey, '');
    CacheManager.setValue(userBioCacheKey, '');
    AppConstants.userIsLoggedIn = false;
    AppConstants.userName = '';
    AppConstants.userId = '';
    AppConstants.userEmail = '';
    AppConstants.userProfileImgUrl = '';
    AppConstants.userPassword = '';
    AppConstants.userBio = '';
    return unit;
  }

  @override
  Future<UserCredential> register(String name, String email, String password) async {
    final signInResult = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    if (signInResult.user != null) {
      await updateUserDisplayName(name);
      await login(email, password);
      log('hola bola');
      return signInResult;
    } else {
      throw Exception();
    }
  }

  @override
  Future<Unit> updateUserDisplayName(String name) async {
    await firebaseAuth.currentUser!.updateDisplayName(name);
    return unit;
  }

  @override
  Future<Unit> updateUserEmail(String email) async {
    await firebaseAuth.currentUser!.updateEmail(email);
    return unit;
  }

  @override
  Future<Unit> updateUserPassword(String password) async {
    await firebaseAuth.currentUser!.updatePassword(password);
    return unit;
  }
}
