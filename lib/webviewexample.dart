import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: Webviewexample(),
  ));
}

class Webviewexample extends StatefulWidget {
  const Webviewexample({super.key});

  @override
  State<Webviewexample> createState() => _WebviewexampleState();
}

class _WebviewexampleState extends State<Webviewexample> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://www.starbucks.in/dashboard"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
