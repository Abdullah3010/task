import 'package:dartz/dartz.dart';
import 'package:jop_task/core/errors/failures.dart';
import 'package:jop_task/features/auth/domain/repositories/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository authRepository;

  LogoutUsecase(this.authRepository);

  Future<Either<Failure, Unit>> call() async {
    return await authRepository.logout();
  }
}
