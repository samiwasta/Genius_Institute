import 'package:flutter/foundation.dart';
import 'package:genius/screens/aboutUs.dart';
import 'package:genius/screens/contactUs.dart';
import 'package:genius/screens/dpps.dart';
import 'package:genius/screens/lectureScreen.dart';
import 'package:genius/screens/notes.dart';
import 'package:genius/screens/privacyPolicy.dart';
import 'package:genius/screens/termsAndConditions.dart';
import 'package:genius/screens/testScreen.dart';
import 'package:genius/screens/timetableForm.dart';
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

  if(kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAM7vAhPO1JuvmfT9YyDB9-siRKnG_2kXY",
          authDomain: "genius-lms.firebaseapp.com",
          projectId: "genius-lms",
          storageBucket: "genius-lms.appspot.com",
          messagingSenderId: "534152837213",
          appId: "1:534152837213:web:fdb487c4beed5f4fcfb5b4",
          measurementId: "G-01047C6QG7"
      )
    );
  }
  else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  db = FirebaseFirestore.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Genius',
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
            return MaterialPageRoute(builder: (_) => const TermsAndConditions());
          case '/privacyPolicy' :
            return MaterialPageRoute(builder: (_) => const PrivacyPolicy());
          case '/testScreen' :
            return MaterialPageRoute(builder: (_) => const TestFormScreen());
          case '/timetableForm' :
            return MaterialPageRoute(builder: (_) => const TimetableForm());
          case '/dpps' :
            return MaterialPageRoute(builder: (_) => const DppScreen());
          case '/notes' :
            return MaterialPageRoute(builder: (_) => const Notes());
          case '/lectureScreen' :
            return MaterialPageRoute(builder: (_) => const LectureScreen());
        }
        return null;
      },
    );
  }
}



