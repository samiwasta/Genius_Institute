import 'package:flutter/material.dart';

class Test {
  final String title;
  final String duration;
  final String URL;

  Test({required this.title, required this.duration, required this.URL});
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
    margin: const EdgeInsets.all(16),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            test.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Duration: ${test.duration}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Add your logic to start the test
            },
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.black87,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12)
            ),
            child: const Text(
              'Attempt Test',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white
              ),
            ),
          ),
        ],
      ),
    ),
  );
}