import 'package:flutter/material.dart';
import 'package:genius/globalData.dart';
import 'package:genius/utilities/liveLectureCard.dart';
import 'package:genius/screens/videoPlayerScreen.dart';

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

  List<String> motivationVideos = [
    'https://www.youtube.com/shorts/Zy7ulOB7oCY',
    'https://www.youtube.com/shorts/Zy7ulOB7oCY',
    'https://www.youtube.com/shorts/Zy7ulOB7oCY',
  ];

  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
      body: isMaterialLoaded ? SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Today's Quote",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  '"Embrace the challenge, for every effort you put in brings you closer to your dream."',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFD2686E),
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child:
                Text(
                  "Today's Classes",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 16),
              liveClasses.isEmpty ? Padding(
                padding: const EdgeInsets.all(16.0),
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
              ) : Container(
                height: 210,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: liveClasses.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
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
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Quick Access",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Instant access to your learning resources",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle lectures button tap
                      },
                      child: Text(
                          'Lectures',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                        padding: EdgeInsets.symmetric(vertical: 20),
                          primary: Colors.pink[50]
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle notes button tap
                      },
                      child: Text(
                          'Notes',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          padding: EdgeInsets.symmetric(vertical: 20),
                        primary: Colors.purple[50],
                      ),
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
                      child: Text(
                          'DPPs',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                          padding: EdgeInsets.symmetric(vertical: 20),
                        primary: Colors.yellow[50],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/timetableForm');// Handle My Timetable button tap
                      },
                      child: Text(
                          'My Timetable',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          padding: EdgeInsets.symmetric(vertical: 20),
                        primary: Colors.blue[50],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Motivation Corner',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                height: 150,
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: motivationVideos.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoPlayerScreen(
                              videoUrl: motivationVideos[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage('https://i.ibb.co/28WpxrC/MOTIVATION.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}