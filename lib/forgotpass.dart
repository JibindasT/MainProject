import 'package:flutter/material.dart';
import 'package:main_project/login.dart';

class forgotScreen extends StatefulWidget {
  const forgotScreen({super.key});

  @override
  State<forgotScreen> createState() => _forgotScreenState();
}

class _forgotScreenState extends State<forgotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                child: const Text('go back'))
          ],
        ),
      ),
    );
  }
}
