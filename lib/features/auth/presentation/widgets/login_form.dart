import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_task/core/widgets/glass_container.dart';
import 'package:jop_task/core/widgets/input_field.dart';
import 'package:jop_task/core/widgets/rounded_button.dart';
import 'package:jop_task/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';

class LoginForm extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();

  LoginForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text(
                'Error',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Text(
                state.errorMessage,
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                RoundedButton(
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        final bloc = BlocProvider.of<AuthBloc>(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "My\nGallary",
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.8),
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            GlassContainer(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 40,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: Text(
                          'LOGIN',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                        ),
                      ),
                      InputField(
                        controller: emailControler,
                        label: 'User Name',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      InputField(
                        controller: passwordControler,
                        label: 'Password',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      RoundedButton(
                        child: Text(
                          'LOGIN',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                        onPressed: () {
                          bloc.add(
                            LoginEvent(
                              email: emailControler.text,
                              password: passwordControler.text,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
