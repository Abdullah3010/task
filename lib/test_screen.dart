import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Test Screen'),
            ElevatedButton(
              onPressed: () async {},
              child: const Text('Go to Login Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
