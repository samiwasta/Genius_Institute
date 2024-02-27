import 'package:flutter/material.dart';
import 'package:genius/globalData.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TestFormScreen extends StatefulWidget {
  const TestFormScreen({super.key});

  @override
  State<TestFormScreen> createState() => _TestFormScreenState();
}

class _TestFormScreenState extends State<TestFormScreen> {
  @override
  Widget build(BuildContext context) {


    //var controller = ModalRoute.of(context)!.settings.arguments as WebViewController;
    // Since for some reason, arguements is not working... we have defined controller as a global variable

    return  Scaffold(
      appBar: AppBar(
        title: Text(testName),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
