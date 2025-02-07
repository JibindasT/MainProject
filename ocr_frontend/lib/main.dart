import 'package:flutter/material.dart';
import 'package:main_project/Profile.dart';
import 'package:main_project/insight.dart';
import 'package:main_project/login.dart';
import 'package:main_project/menu.dart';
import 'img_upload.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        // '/login': (context) => LoginPage(), // Define the login route
        '/home': (context) => ImageScreen(),
        '/activities': (context) => insightPage(),
        '/menu': (context) => menuPage(),
        '/profile': (context) => ProfilePage(),
      },
      title: 'Login & Signup',
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          selectedItemColor: const Color.fromARGB(255, 250, 151, 4),
          unselectedItemColor: Colors.white,
        ),
      ),
      home: LoginPage(),
    );
  }
}
