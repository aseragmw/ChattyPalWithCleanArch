import 'package:chatty_pal/core/errors/failures.dart';
import 'package:chatty_pal/features/auth/domian/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterUsecase {
  final AuthRepository authRepository;

  RegisterUsecase({required this.authRepository});

  Future<Either<Failure, UserCredential>> call(String name, String email, String password) {
    return authRepository.register(name, email, password);
  }
}
