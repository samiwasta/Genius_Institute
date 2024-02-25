import 'package:genius/utilities/bottomNavigationBar.dart';
import 'package:genius/screens/study.dart';
import 'package:genius/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:genius/screens/login.dart';
import 'package:genius/screens/otpVerification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:genius/globalData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  db = FirebaseFirestore.instance;
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



