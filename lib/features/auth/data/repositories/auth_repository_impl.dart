import 'package:chatty_pal/core/errors/failures.dart';
import 'package:chatty_pal/features/auth/data/datasources/remote_data_source/auth_remote_datasource.dart';
import 'package:chatty_pal/features/auth/domian/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, Unit>> login(String email, String password) async {
    try {
      await remoteDataSource.login(email, password);
      return Right(unit);
    } catch (e) {
      return Left(Failure(message: 'Login Failed, Please try again.'));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await remoteDataSource.logout();
      return Right(unit);
    } catch (e) {
      return Left(Failure(message: 'Logout Failed, Please try again.'));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> register(String name, String email, String password) async {
    try {
      final credentials = await remoteDataSource.register(name, email, password);
      
      return Right(credentials);
    } catch (e) {
      return Left(Failure(message: 'Register Failed, Please try again.'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUserDisplayName(String name) async {
    try {
      await remoteDataSource.updateUserDisplayName(name);
      return Right(unit);
    } catch (e) {
      return Left(Failure(message: 'Error occured, Please try again.'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUserEmail(String email) async {
    try {
      await remoteDataSource.updateUserEmail(email);
      return Right(unit);
    } catch (e) {
      return Left(Failure(message: 'Error occured, Please try again.'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUserPassword(String password) async {
    try {
      await remoteDataSource.updateUserPassword(password);
      return Right(unit);
    } catch (e) {
      return Left(Failure(message: 'Error occured, Please try again.'));
    }
  }
}
