import 'package:flutter/material.dart';
import 'package:Genius/screens/study.dart';
import 'package:Genius/screens/batches.dart';
import 'package:Genius/screens/test.dart';
import 'package:Genius/screens/profile.dart';
import 'package:Genius/globalData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 1;

  static final List<Widget> _screens = <Widget>[
    StudyScreen(),
    BatchesScreen(),
    TestScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      if (user!['batches'].length == 0) {
        _selectedIndex = 1;
      }
      else {
        _selectedIndex = 0;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Study',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Batches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFD2686E),
        onTap: _onItemTapped,
      ),
    );
  }
}
