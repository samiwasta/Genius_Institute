import 'package:flutter/material.dart';

class Lecture {
  final String title;
  final List<LectureItem> lectureItems;

  Lecture({required this.title, required this.lectureItems});
}

class LectureItem {
  final String title;
  final Function onTap;

  LectureItem({required this.title, required this.onTap});
}

Widget buildLectureTiles(List<Lecture> lectures) {
  return ListView.builder(
    itemCount: lectures.length,
    itemBuilder: (context, index) {
      return _buildLectureTile(lectures[index]);
    },
  );
}

Widget _buildLectureTile(Lecture lecture) {
  return ExpansionTile(
    title: Text(
      lecture.title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    children: lecture.lectureItems.map((item) {
      return ListTile(
        title: Text(item.title),
        onTap: () {
          item.onTap();
        },
      );
    }).toList(),
  );
}
