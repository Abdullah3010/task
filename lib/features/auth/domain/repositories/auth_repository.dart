import 'package:dartz/dartz.dart';
import 'package:jop_task/core/errors/failures.dart';
import 'package:jop_task/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, Unit>> logout();
}
