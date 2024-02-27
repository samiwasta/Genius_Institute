import 'package:flutter/material.dart';
import 'package:genius/globalData.dart';
import 'package:genius/utilities/liveLectureCard.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({Key? key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  String _selectedExam = "IIT-JEE";

  // Sample data for demonstration
  List<Map<String, dynamic>> liveClasses = [
    {
      'title': 'Live Class 1',
      'thumbnail': 'https://i.ibb.co/fNPhqvM/CETCRASH.png',
    },
    {
      'title': 'Live Class 2',
      'thumbnail': 'https://i.ibb.co/fNPhqvM/CETCRASH.png',
    },
    {
      'title': 'Live Class 3',
      'thumbnail': 'https://i.ibb.co/fNPhqvM/CETCRASH.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Study for: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            DropdownButton<String>(
              value: _selectedExam,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedExam = newValue!;
                });
              },
              items: <String>['IIT-JEE', 'NEET', 'MHT-CET'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                );
              }).toList(),
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
                size: 16,
              ),
              underline: Container(),
            ),
          ],
        ),
      ),
      body: isMaterialLoaded ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Today's classes",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 16),
            liveClasses.isEmpty ? Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Center(
                child: Text(
                  'No classes scheduled',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ) : SizedBox(
              height: 210,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: liveClasses.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: LiveLectureCard(
                        title: liveClasses[index]['title'],
                        thumbnailUrl: liveClasses[index]['thumbnail'],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle lectures button tap
                    },
                    child: Text('Lectures'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle notes button tap
                    },
                    child: Text('Notes'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle DPPs button tap
                    },
                    child: Text('DPPs'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle My Timetable button tap
                    },
                    child: Text('My Timetable'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ) : Center(child: CircularProgressIndicator()),
    );
  }
}