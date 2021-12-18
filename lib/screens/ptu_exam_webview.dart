import 'dart:async';
import 'dart:io';

import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  bool isLoading = true;
  late WebViewController _controller;
  final Completer<WebViewController> _controllerCompleter =
      Completer<WebViewController>();

  Future<bool> _onWillPop(BuildContext context) async {
    print("onwillpop");
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          title: 'PTU Exam',
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              WebView(
                initialUrl: widget.url,
                onWebViewCreated: (WebViewController c) {
                  _controllerCompleter.future
                      .then((value) => _controller = value);
                  _controllerCompleter.complete(c);
                },
                onWebResourceError: (error) => Text(error.description),
                javascriptMode: JavascriptMode.unrestricted,
                onPageFinished: (finish) {
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
