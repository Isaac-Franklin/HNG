import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class HNGBacklinksViewRepo extends StatefulWidget {
  final String linkUrl;
  const HNGBacklinksViewRepo({super.key, required this.linkUrl});

  @override
  State<HNGBacklinksViewRepo> createState() => _HNGBacklinksViewRepoState();
}

class _HNGBacklinksViewRepoState extends State<HNGBacklinksViewRepo> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    // Set the platform-specific WebView implementation
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..loadRequest(Uri.parse(widget.linkUrl));

    WebViewPlatform.instance ??= WebKitWebViewPlatform(); //for iOS platform
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("HNG Backlink Page"),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
