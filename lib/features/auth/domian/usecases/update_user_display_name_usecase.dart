import 'package:ChattyPal/core/errors/failures.dart';
import 'package:ChattyPal/features/auth/domian/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateDisplayNameUsecase {
  final AuthRepository authRepository;

  UpdateDisplayNameUsecase({required this.authRepository});

  Future<Either<Failure, Unit>> call(String name) {
    return authRepository.updateUserDisplayName(name);
  }
}
