import 'package:flutter/material.dart';

class Test {
  final String title;
  final String duration;

  Test({required this.title, required this.duration});
}

Widget buildTestCards(List<Test> tests) {
  return ListView.builder(
    itemCount: tests.length,
    itemBuilder: (context, index) {
      return _buildTestCard(tests[index]);
    },
  );
}

Widget _buildTestCard(Test test) {
  return Card(
    margin: EdgeInsets.all(16),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            test.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Duration: ${test.duration}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Add your logic to start the test
            },
            child: Text(
                'Attempt Test',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white
              ),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.black87,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12)
            ),
          ),
        ],
      ),
    ),
  );
}
