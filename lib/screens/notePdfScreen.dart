import 'package:flutter/material.dart';

class NotePdfScreen extends StatefulWidget {
  const NotePdfScreen({super.key});

  @override
  State<NotePdfScreen> createState() => _NotePdfScreenState();
}

class _NotePdfScreenState extends State<NotePdfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes Viewer'),
      ),
    );
  }
}
