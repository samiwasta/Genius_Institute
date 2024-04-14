import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

var db;
String? phonenumber;
Map<String, dynamic>? user;


List testMaterial = [];
List videoMaterial = [];
List noteMaterial = [];
List dppMaterial = [];

bool isMaterialLoaded = false;

String testName = "Test";

WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  );
