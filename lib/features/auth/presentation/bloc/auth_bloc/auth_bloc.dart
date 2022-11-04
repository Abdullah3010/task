import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jop_task/core/strings/failure_messages.dart';

import 'package:jop_task/core/user/current_user.dart';
import 'package:jop_task/features/auth/data/models/user_model.dart';
import 'package:jop_task/features/auth/domain/usecases/login.dart';
import 'package:jop_task/features/auth/domain/usecases/logout.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;

  bool isPassword = true;

  AuthBloc({
    required this.loginUsecase,
    required this.logoutUsecase,
  }) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(AuthLodingState());
        final loginResponse = await loginUsecase(
          email: event.email,
          password: event.password,
        );
        loginResponse.fold(
          (failure) => emit(
            const AuthErrorState(
              errorMessage: 'Error when login',
            ),
          ),
          (user) {
            CurrentUser.setUser(user);
            emit(AuthLoginSuccessState(user: user));
          },
        );
      } else if (event is LogOutEvent) {
        emit(AuthLodingState());
        final loginResponse = await logoutUsecase();
        loginResponse.fold(
          (failure) => emit(const AuthErrorState(errorMessage: SERVER_ERROR)),
          (_) => emit(AuthLogoutSuccessState()),
        );
      }
    });
  }

  
}
