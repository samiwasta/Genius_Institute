import 'package:flutter/material.dart';
import 'package:genius/globalData.dart';

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
      body: (isMaterialLoaded)? const Column(
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
      ) : const Center(child: CircularProgressIndicator(),),
    );
  }
}
