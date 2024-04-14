import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(child: SizedBox()),
            Text(
              'About Us',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Color(0xFFD2686E),
              ),
            ),
            SizedBox(height: 16,),
            Text(
              'Welcome to Genius Institute, where we are dedicated to providing top-quality education and training to help individuals reach their full potential. Founded by Mr. Ajit Palkar and co-founded by Mr. Manoj Mahale, Genius Institute is committed to excellence in education.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 14,),
            Text(
              'At Genius Institute, we believe that every individual has the capacity for greatness, and our mission is to unlock that potential through innovative teaching methods, personalized guidance, and a supportive learning environment.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 14,),
            Text(
              "With years of experience in the education sector, Mr. Ajit Palkar and Mr. Manoj Mahale bring a wealth of knowledge and expertise to Genius Institute. Their vision is to empower students with the skills and knowledge they need to succeed in today's competitive world.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 14,),
            Text(
              "From comprehensive study materials to interactive classes led by experienced instructors, Genius Institute offers a wide range of programs tailored to meet the diverse needs of our students. Whether you're preparing for entrance exams, seeking career advancement, or simply looking to expand your knowledge, Genius Institute is here to help you achieve your goals.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 14,),
            Text(
              "Join us at Genius Institute and embark on a journey of learning, growth, and success!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
