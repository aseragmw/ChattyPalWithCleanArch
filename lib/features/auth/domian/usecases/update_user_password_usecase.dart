import 'package:ChattyPal/core/errors/failures.dart';
import 'package:ChattyPal/features/auth/domian/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateUserPasswordUsecase {
  final AuthRepository authRepository;

  UpdateUserPasswordUsecase({required this.authRepository});

  Future<Either<Failure, Unit>> call(String password) {
    return authRepository.updateUserPassword(password);
  }
}
