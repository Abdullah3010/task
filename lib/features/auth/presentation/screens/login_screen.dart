import 'package:flutter/material.dart';
import 'package:jop_task/features/auth/presentation/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.purpleAccent.shade200,
              Colors.amber.shade100,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SizedBox(
              width: 300,
              child: LoginForm(),
            ),
          ),
        ),
      ),
    );
  }
}
