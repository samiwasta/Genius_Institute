import 'package:genius/screens/aboutUs.dart';
import 'package:genius/screens/contactUs.dart';
import 'package:genius/screens/privacyPolicy.dart';
import 'package:genius/screens/termsAndConditions.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


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
            return MaterialPageRoute(builder: (_) => const Login());
          case '/otpVerification':
            return MaterialPageRoute(
              builder: (_) => OTPVerification(phoneNumber: settings.arguments as String),
            );
          case '/register' :
            return MaterialPageRoute(builder: (_) => const Register());
          case '/bottomNavigationBar' :
            return MaterialPageRoute(builder: (_) => const BottomNavigationBarWidget());
          case '/study' :
            return MaterialPageRoute(builder: (_) => const StudyScreen());
          case '/aboutUs' :
            return MaterialPageRoute(builder: (_) => const AboutUs());
          case '/contactUs' :
            return MaterialPageRoute(builder: (_) => ContactUsScreen());
          case '/termsAndConditions' :
            return MaterialPageRoute(builder: (_) => TermsAndConditions());
          case '/privacyPolicy' :
            return MaterialPageRoute(builder: (_) => PrivacyPolicy());
          default:
            return MaterialPageRoute(builder: (_) => const Login());
        }
      },
    );
  }
}



