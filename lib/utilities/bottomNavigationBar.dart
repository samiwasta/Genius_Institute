import 'package:flutter/material.dart';
import 'package:genius/screens/study.dart';
import 'package:genius/screens/batches.dart';
import 'package:genius/screens/test.dart';
import 'package:genius/screens/profile.dart';
import 'package:genius/globalData.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 1;

  static final List<Widget> _screens = <Widget>[
    const StudyScreen(),
    const BatchesScreen(),
    const TestsScreen(),
    const ProfileScreen(),
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

    // Fetch all relevant material
    db.collection("material").get().then(
          (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {

          var data = docSnapshot.data();

          if (data['type'] == 0) {
            testMaterial.add(data);
          }
          else if (data['type'] == 1) {
            videoMaterial.add(data);
          }
          else if (data['type'] == 2) {
            noteMaterial.add(data);
          }

          setState(() {
            isMaterialLoaded = true;
          });


        }
      },
      onError: (e) => print("Error completing: $e"),
    );

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
        selectedItemColor: const Color(0xFFD2686E),
        onTap: _onItemTapped,
      ),
    );
  }
}
