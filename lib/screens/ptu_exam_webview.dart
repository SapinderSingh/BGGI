import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:bgiet/widgets/press_back_again_to_close.dart';
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
      appBar: customAppBar(
        context: context,
        title: 'PTU Exam',
      ),
      body: pressBackAgainToClose(
        child: Stack(
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
      ),
    );
  }
}
