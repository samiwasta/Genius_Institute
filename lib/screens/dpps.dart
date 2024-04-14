import 'dart:io';

import 'package:flutter/material.dart';
import 'package:genius/utilities//dppTile.dart'; // Adjust import path accordingly
import 'package:dio/dio.dart'; // Import Dio dependency
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart'; // Import permission_handler

class DppScreen extends StatefulWidget {
  const DppScreen({super.key});

  @override
  State<DppScreen> createState() => _DppScreenState();
}

class _DppScreenState extends State<DppScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    requestPermission(); // Request permission when initializing the screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DPPs'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFFD2686E),
          labelColor: const Color(0xFFD2686E),
          tabs: const [
            Tab(text: 'Physics'),
            Tab(text: 'Chemistry'),
            Tab(text: 'Maths'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabBarView(
          controller: _tabController,
          children: [
            buildDppTiles(_getPhysicsDpps()), // Assuming _getPhysicsDpps() returns a list of Dpp objects for Physics
            buildDppTiles(_getChemistryDpps()), // Similarly for Chemistry and Maths
            buildDppTiles(_getMathsDpps()),
          ],
        ),
      ),
    );
  }

  // Define functions to get DPPs for different subjects
  List<Dpp> _getPhysicsDpps() {
    // Retrieve and return DPPs for Physics
    // Example:
    return [
      Dpp(
        title: 'Physics DPP 1',
        dppItems: [
          DppItem(
            title: 'Item 2',
            onTap: () {
              // Handle action for Item 2
              openFile(
                  url: 'https://physicsaholics.com/assets/pdf/uploads1655277946DPP-1-Kinematics-%20Speed,%20Velocity,%20Distance%20and%20Displacement.pdf',
                  fileName: 'Kinematics-DPP-1.pdf'
              );
            },
          ),
          // Add more DPP items as needed
        ],
      ),
      // Add more DPPs as needed
    ];
  }

  List<Dpp> _getChemistryDpps() {
    // Retrieve and return DPPs for Chemistry
    // Example:
    return [
      // Add more DPPs as needed
    ];
  }

  List<Dpp> _getMathsDpps() {
    // Retrieve and return DPPs for Maths
    // Example:
    return [
      // Add more DPPs as needed
    ];
  }

  Future<void> requestPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }
    if (status.isDenied) {
      // Handle the case where permission is denied
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

Future openFile({required String url, String? fileName}) async {
  final file = await downloadFile(url, fileName!);
  if (file == null) {
    print('Error: File is null');
    return;
  }

  print('File downloaded successfully. Path: ${file.path}');

  final openResult = await OpenFile.open(file.path);
  print('File opened: ${openResult.type}');

  if (openResult.type == ResultType.permissionDenied) {
    // Permission denied
  }
}

Future<File?> downloadFile(String url, String name) async {
  final appStorage = await getApplicationDocumentsDirectory();
  final file = File('${appStorage.path}/$name');

  try {
    final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
        )
    );

    await file.writeAsBytes(response.data);

    return file;
  } catch(e) {
    return null;
  }
}
