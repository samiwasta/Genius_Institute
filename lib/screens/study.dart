import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:genius/globalData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (isMaterialLoaded)? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*
          ElevatedButton(onPressed: () async{
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.clear();
            Navigator.popAndPushNamed(context, '/login');
          }, child: Text('Logout')),

           */


          Center(child: Text('Study Screen'),),
        ],
      ) : Center(child: CircularProgressIndicator(),),
    );
  }
}
