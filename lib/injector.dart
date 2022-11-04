import 'package:jop_task/core/network/network_info.dart';
import 'package:jop_task/features/auth/data/datasources/auth_remote_date_source.dart';
import 'package:jop_task/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:jop_task/features/auth/domain/repositories/auth_repository.dart';
import 'package:jop_task/features/auth/domain/usecases/login.dart';
import 'package:jop_task/features/auth/domain/usecases/logout.dart';
import 'package:jop_task/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jop_task/features/gallery/data/datasources/gallery_remote_data_source.dart';
import 'package:jop_task/features/gallery/data/repositories/my_gallery_repo_imp.dart';
import 'package:jop_task/features/gallery/domain/repositories/my_gallery_repositories.dart';
import 'package:jop_task/features/gallery/domain/usecases/get_images_usecase.dart';
import 'package:jop_task/features/gallery/domain/usecases/upload_image_usecase.dart';
import 'package:jop_task/features/gallery/presentation/bloc/my_gallery_bloc/my_gallery_bloc.dart';

class MyInjector {
  static final injector = GetIt.instance;

  static Future<void> init() async {
//! Features - auth

// Bloc

    injector.registerFactory<AuthBloc>(
      () => AuthBloc(
        loginUsecase: injector(),
        logoutUsecase: injector(),
      ),
    );

// Usecases

    injector.registerLazySingleton(() => LoginUsecase(injector()));
    injector.registerLazySingleton(() => LogoutUsecase(injector()));

// Repository

    injector.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(
        authRemoteDateSource: injector(), networkInfo: injector()));

// Datasources

    injector.registerLazySingleton<AuthRemoteDateSource>(
      () => AuthRemoteImpWithHttp(),
    );
    injector
        .registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(injector()));

//! Features - auth

// Bloc

    injector.registerFactory<MyGalleryBloc>(
      () => MyGalleryBloc(
        getImagesUseCase: injector(),
        uploadImageUseCase: injector(),
      ),
    );

// Usecases

    injector.registerLazySingleton(() => GetImagesUseCase(injector()));
    injector.registerLazySingleton(() => UpladImageUseCase(injector()));

// Repository

    injector.registerLazySingleton<MyGalleryRepositories>(() =>
        MyGalleryRepoImp(
            galleryRemoteDateSource: injector(), networkInfo: injector()));

// Datasources

    injector.registerLazySingleton<GalleryRemoteDateSource>(
      () => GalleryRemoteImpWithHttp(),
    );

//! External
    injector.registerLazySingleton(() => InternetConnectionChecker());
  }
}
