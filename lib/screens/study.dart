import 'package:flutter/material.dart';
import 'package:genius/globalData.dart';
import 'dart:math';
import 'package:genius/utilities/liveLectureCard.dart';
import 'package:genius/screens/videoPlayerScreen.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  String _selectedExam = "IIT-JEE";

  // Sample data for demonstration
  List<Map<String, dynamic>> liveClasses = [
    // {
    //   'title': 'Live Class 1',
    //   'thumbnail': 'https://i.ibb.co/fNPhqvM/CETCRASH.png',
    // },
    // {
    //   'title': 'Live Class 2',
    //   'thumbnail': 'https://i.ibb.co/fNPhqvM/CETCRASH.png',
    // },
    // {
    //   'title': 'Live Class 3',
    //   'thumbnail': 'https://i.ibb.co/fNPhqvM/CETCRASH.png',
    // },
  ];

  List<String> motivationVideos = [
    'https://www.youtube.com/shorts/Zy7ulOB7oCY',
    'https://www.youtube.com/shorts/Zy7ulOB7oCY',
    'https://www.youtube.com/shorts/Zy7ulOB7oCY',
  ];

  List<String> quotes = [
    "Success is the sum of small efforts repeated day in and day out.",
    "Believe you can and you're halfway there.",
    "Dream big, work hard, stay focused, and surround yourself with good people.",
    "Every accomplishment starts with the decision to try.",
    "The only way to do great work is to love what you do.",
    "Success doesn't come to you, you go to it.",
    "Push yourself because no one else is going to do it for you.",
    "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    "The future belongs to those who believe in the beauty of their dreams.",
    "Don't watch the clock; do what it does. Keep going.",
    "The harder you work for something, the greater you'll feel when you achieve it.",
    "Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle.",
    "Your limitation—it's only your imagination.",
    "Set your goals high and don't stop until you get there.",
    "The secret of getting ahead is getting started.",
    "Strive for progress, not perfection.",
    "You are never too old to set another goal or to dream a new dream.",
    "It does not matter how slowly you go, as long as you do not stop.",
    "Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful.",
    "Don't be afraid to give up the good to go for the great.",
    "The only limit to our realization of tomorrow will be our doubts of today.",
    "The way to get started is to quit talking and begin doing.",
    "In the middle of every difficulty lies opportunity.",
    "The difference between ordinary and extraordinary is that little extra.",
    "The only person you should try to be better than is the person you were yesterday.",
    "The journey of a thousand miles begins with one step.",
    "You don't have to be great to start, but you have to start to be great.",
    "The only way to achieve the impossible is to believe it is possible.",
    "You are capable of more than you know.",
    "Success is not just about reaching the destination; it's about enjoying the journey.",
    "You miss 100% of the shots you don't take.",
    "Nothing will work unless you do.",
    "Don't let what you cannot do interfere with what you can do.",
    "Your attitude determines your direction.",
    "The only place where success comes before work is in the dictionary.",
    "Opportunities don't happen, you create them.",
    "You are never too young to dream big and never too old to set a new goal.",
    "Hard work beats talent when talent doesn't work hard.",
    "Your time is limited, don't waste it living someone else's life.",
    "The only person you should try to be better than is the person you were yesterday.",
    "Every expert was once a beginner.",
    "The best way to predict the future is to create it.",
    "Don't wait for opportunity. Create it.",
    "Success is the result of perfection, hard work, learning from failure, loyalty, and persistence.",
    "Don't be pushed around by the fears in your mind. Be led by the dreams in your heart.",
    "Don't limit your challenges, challenge your limits.",
    "Success is not in what you have, but who you are.",
    "You don't have to be great to start, but you have to start to be great.",
    "Strive for progress, not perfection.",
    "It always seems impossible until it's done.",
  ];


  String getDailyQuote() {
    // Get the current date
    DateTime now = DateTime.now();

    // Calculate the day of the year
    int dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays + 1;

    // Use a random seed based on the current day
    Random random = Random(dayOfYear);

    // Generate a random index within the range of quotes list
    int quoteIndex = random.nextInt(quotes.length);

    // Return the randomly selected quote
    return quotes[quoteIndex];
  }

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String dailyQuote = getDailyQuote();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
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
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                );
              }).toList(),
              icon: const Icon(
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
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Today's Quote",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        dailyQuote,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFFD2686E),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Transform.rotate(
                        angle: -pi / 4,
                        child: const Text(
                          '"',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD2686E),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Transform.rotate(
                        angle: pi / 4,
                        child: const Text(
                          '"',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD2686E),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
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
              const SizedBox(height: 16),
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
              ) : SizedBox(
                height: 210,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: liveClasses.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
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
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Quick Access",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Instant access to your learning resources",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/lectureScreen');// Handle lectures button tap
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ), backgroundColor: Colors.pink[50],
                        padding: const EdgeInsets.symmetric(vertical: 20)
                      ),
                      child: const Text(
                          'Lectures',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle notes button tap
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ), backgroundColor: Colors.purple[50],
                          padding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      child: const Text(
                          'Notes',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/dpps');// Handle DPPs button tap
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ), backgroundColor: Colors.yellow[50],
                          padding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      child: const Text(
                          'DPPs',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/timetableForm');// Handle My Timetable button tap
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ), backgroundColor: Colors.blue[50],
                          padding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      child: const Text(
                          'My Timetable',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Motivation Corner',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
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
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
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
          : const Center(child: CircularProgressIndicator()),
    );
  }
}