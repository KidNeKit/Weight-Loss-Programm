import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../dependency_injection.dart';
import '../repositories/url_receiver_repository.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late WebViewController _controller;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(locator.call<UrlReceiverRepository>().url!));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await _controller.canGoBack()) {
          log("go back");
          _controller.goBack();
        }
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: WebViewWidget(
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
