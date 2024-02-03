import 'package:chatty_pal/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> login(String email, String password);
  Future<Either<Failure, UserCredential>> register(String name, String email, String password);
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, Unit>> updateUserDisplayName(String name);
  Future<Either<Failure, Unit>> updateUserEmail(String email);
  Future<Either<Failure, Unit>> updateUserPassword(String password);
}
