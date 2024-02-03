import 'package:ChattyPal/core/errors/failures.dart';
import 'package:ChattyPal/features/auth/domian/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateUserEmailUsecase {
  final AuthRepository authRepository;

  UpdateUserEmailUsecase({required this.authRepository});

  Future<Either<Failure, Unit>> call(String email) {
    return authRepository.updateUserEmail(email);
  }
}
