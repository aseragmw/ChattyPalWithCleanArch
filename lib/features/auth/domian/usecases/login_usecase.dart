import 'package:ChattyPal/core/errors/failures.dart';
import 'package:ChattyPal/features/auth/domian/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase({required this.authRepository});

  Future<Either<Failure, Unit>> call(String email, String password) {
    return authRepository.login(email, password);
  }
}
