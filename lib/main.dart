import 'package:Genius/bottomNavigationBar.dart';
import 'package:Genius/study.dart';
import 'package:Genius/register.dart';
import 'package:flutter/material.dart';
import 'package:Genius/login.dart';
import 'package:Genius/otpVerification.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => Login());
          case '/otpVerification':
            return MaterialPageRoute(
              builder: (_) => OTPVerification(phoneNumber: settings.arguments as String),
            );
          case '/register' :
            return MaterialPageRoute(builder: (_) => Register());
          case '/bottomNavigationBar' :
            return MaterialPageRoute(builder: (_) => BottomNavigationBarWidget());
          case '/study' :
            return MaterialPageRoute(builder: (_) => StudyScreen());
          default:
            return MaterialPageRoute(builder: (_) => Login());
        }
      },
    );
  }
}
