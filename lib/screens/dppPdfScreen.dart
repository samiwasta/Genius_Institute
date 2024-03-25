import 'package:flutter/material.dart';

class DppPdfScreen extends StatefulWidget {
  const DppPdfScreen({super.key});

  @override
  State<DppPdfScreen> createState() => _DppPdfScreenState();
}

class _DppPdfScreenState extends State<DppPdfScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DPP Viewer'),
      ),
    );
  }
}


