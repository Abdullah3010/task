import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_task/config/themes/app_light_theme.dart';
import 'package:jop_task/core/user/current_user.dart';
import 'package:jop_task/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:jop_task/features/auth/presentation/screens/login_screen.dart';
import 'package:jop_task/features/gallery/presentation/screens/my_gallery_screen.dart';

import 'package:jop_task/injector.dart';
import 'package:jop_task/observer.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await MyInjector.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MyInjector.injector<AuthBloc>()),
      ],
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final currentUser = CurrentUser.getUser();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Jop Task',
            theme: appTheme,
            home: currentUser == null
                ? const LoginScreen()
                : const MyGalleryScreen(),
          );
        },
      ),
    );
  }
}
