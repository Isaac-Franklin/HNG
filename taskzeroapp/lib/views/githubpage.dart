import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class ViewRepo extends StatefulWidget {
  const ViewRepo({super.key});

  @override
  State<ViewRepo> createState() => _ViewRepoState();
}

class _ViewRepoState extends State<ViewRepo> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    // Set the platform-specific WebView implementation
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..loadRequest(Uri.parse("https://github.com/Isaac-Franklin/HNG"));

    WebViewPlatform.instance ??= WebKitWebViewPlatform(); //for iOS platform
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("View GitHub Page"),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
