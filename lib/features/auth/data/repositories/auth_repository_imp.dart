import 'package:flutter/foundation.dart';
import 'package:jop_task/core/errors/errors_exceptions.dart';
import 'package:jop_task/features/auth/data/datasources/auth_remote_date_source.dart';
import 'package:jop_task/features/auth/data/models/user_model.dart';
import 'package:jop_task/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:jop_task/features/auth/domain/repositories/auth_repository.dart';
import 'package:jop_task/core/network/network_info.dart';

class AuthRepositoryImp extends AuthRepository {
  final AuthRemoteDateSource authRemoteDateSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImp({
    required this.authRemoteDateSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final user = await authRemoteDateSource.login(
          email: email,
          password: password,
        );
        return Right(user);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left(_getLocalLoginFailure(const FormatException()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      if (await networkInfo.isConnected) {
        await authRemoteDateSource.logout();
        return const Right(unit);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left(ServerFailure());
    }
  }


  Failure _getLocalLoginFailure(Exception exception) {
    if (exception is AuthLocalUserNotFountException) {
      return AuthLocalUserNotFountFailure();
    } else if (exception is UnexpectedDatabaseException) {
      return UnexpectedDatabaseFailure();
    } else if (exception is ServerException) {
      return ServerFailure();
    }
    return UnexpectedFailure();
  }


}
