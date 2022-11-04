import 'package:dartz/dartz.dart';
import 'package:jop_task/core/errors/failures.dart';
import 'package:jop_task/features/auth/data/models/user_model.dart';
import 'package:jop_task/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);

  Future<Either<Failure, UserModel>> call({
    required String email,
    required String password,
  }) async {
    return await authRepository.login(
      email: email,
      password: password,
    );
  }
}
