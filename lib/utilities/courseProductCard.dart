import 'package:flutter/material.dart';
import 'package:Genius/globalData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CourseProductCard extends StatefulWidget {
  final String title;
  final String batch;
  final String imageUrl;
  final String price;
  final String duration; // Duration of the course

  const CourseProductCard({
    Key? key,
    required this.title,
    required this.batch,
    required this.imageUrl,
    required this.price,
    required this.duration,
  }) : super(key: key);

  @override
  State<CourseProductCard> createState() => _CourseProductCardState();
}

class _CourseProductCardState extends State<CourseProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey, width: 1), // Add border side
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Targeted Batch: ${widget.batch}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.watch_later_outlined),
                          SizedBox(width: 4),
                          Text(
                            widget.duration, // Display duration
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: (user!['batches'].contains(widget.title)) ? () {

                        } : () {
                          setState(() {
                            user!['batches'].add(widget.title);
                            db
                                .collection("users")
                                .doc(phonenumber)
                                .update(user);
                          });
                        },
                        child: Text(
                          (user!['batches'].contains(widget.title)) ? 'Study' : 'Purchase',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: (user!['batches'].contains(widget.title)) ? Colors.green  : Colors.black87,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
