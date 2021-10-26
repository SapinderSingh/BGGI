import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PTUExamWebView extends StatefulWidget {
  const PTUExamWebView({Key? key}) : super(key: key);

  @override
  _PTUExamWebViewState createState() => _PTUExamWebViewState();
}

class _PTUExamWebViewState extends State<PTUExamWebView> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('PTU Exam'),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: 'https://m.ptuexam.com',
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
    );
  }
}
