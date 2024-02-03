import 'package:ChattyPal/core/errors/failures.dart';
import 'package:ChattyPal/features/auth/domian/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LogoutUseCase {
  final AuthRepository authRepository;

  LogoutUseCase({required this.authRepository});

  Future<Either<Failure, Unit>> call() {
    return authRepository.logout();
  }
}
