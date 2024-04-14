import 'package:flutter/material.dart';
import 'package:genius/utilities/lectureTile.dart';
import 'package:genius/screens/videoPlayerScreen.dart';

class LectureScreen extends StatefulWidget {
  const LectureScreen({super.key});

  @override
  State<LectureScreen> createState() => _LectureScreenState();
}

class _LectureScreenState extends State<LectureScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  List<String> physicsLectures = [
    'https://www.youtube.com/watch?v=Ewx1bo3Vyzg&list=PLbu_fGT0MPsuUzCT6BZvto0hkcA3dEigi&index=1',
    'https://www.youtube.com/watch?v=QijmnDHE9II&list=PLbu_fGT0MPsuUzCT6BZvto0hkcA3dEigi&index=2',
    'https://www.youtube.com/watch?v=QijmnDHE9II&list=PLbu_fGT0MPsuUzCT6BZvto0hkcA3dEigi&index=3',
    'https://www.youtube.com/watch?v=QijmnDHE9II&list=PLbu_fGT0MPsuUzCT6BZvto0hkcA3dEigi&index=4',
    'https://www.youtube.com/watch?v=QijmnDHE9II&list=PLbu_fGT0MPsuUzCT6BZvto0hkcA3dEigi&index=5',
    'https://www.youtube.com/watch?v=QijmnDHE9II&list=PLbu_fGT0MPsuUzCT6BZvto0hkcA3dEigi&index=6',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lectures'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFFD2686E),
          labelColor: const Color(0xFFD2686E),
          tabs: const [
            Tab(text: 'Physics'),
            Tab(text: 'Chemistry'),
            Tab(text: 'Maths'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabBarView(
          controller: _tabController,
          children: [
            buildLectureTiles(_getPhysicsLectures()), // Assuming _getPhysicsDpps() returns a list of Dpp objects for Physics
            buildLectureTiles(_getChemistryLectures()), // Similarly for Chemistry and Maths
            buildLectureTiles(_getMathsLectures()),
          ],
        ),
      ),
    );
  }

  // Define functions to get DPPs for different subjects
  List<Lecture> _getPhysicsLectures() {
    // Retrieve and return lectures for Physics
    // Example:
    return [
      Lecture(
        title: 'Basic Kinematics',
        lectureItems: [
          LectureItem(
            title: 'Lecture 1 | Basic Kinematics',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(
                    videoUrl: physicsLectures[0],
                  ),
                ),
              );
            },
          ),
          LectureItem(
            title: 'Lecture 2 | Basic Kinematics',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(
                    videoUrl: physicsLectures[1],
                  ),
                ),
              );// Handle action for Item 2
            },
          ),
          LectureItem(
            title: 'Lecture 3 | Basic Kinematics',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(
                    videoUrl: physicsLectures[2],
                  ),
                ),
              );// Handle action for Item 2
            },
          ),
          // Add more lecture items as needed
        ],
      ),
      Lecture(
        title: 'Units and Dimensions',
        lectureItems: [
          LectureItem(
            title: 'Lecture 1 | Units and Dimensions',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(
                    videoUrl: physicsLectures[3],
                  ),
                ),
              );
            },
          ),
          LectureItem(
            title: 'Lecture 2 | Units and Dimensions',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(
                    videoUrl: physicsLectures[4],
                  ),
                ),
              );// Handle action for Item 2
            },
          ),
          LectureItem(
            title: 'Lecture 3 | Units and Dimensions',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(
                    videoUrl: physicsLectures[5],
                  ),
                ),
              );// Handle action for Item 2
            },
          ),
          // Add more lecture items as needed
        ],
      ),
      // Add more lectures as needed
    ];
  }

  List<Lecture> _getChemistryLectures() {
    // Retrieve and return DPPs for Chemistry
    // Example:
    return [
      // Add more DPPs as needed
    ];
  }

  List<Lecture> _getMathsLectures() {
    // Retrieve and return DPPs for Maths
    // Example:
    return [
      // Add more DPPs as needed
    ];
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
