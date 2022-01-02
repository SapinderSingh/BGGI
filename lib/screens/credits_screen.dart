import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';

class CreditsScreen extends StatelessWidget {
  const CreditsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credits'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          h6Text(context, 'Images Credits: '),
          _customTextButton(
            context,
            title: 'Unsplash.com',
            url: 'https://unsplash.com/',
          ),
          _customTextButton(
            context,
            title: 'Pixabay.com',
            url: 'https://pixabay.com/',
          ),
          _customTextButton(
            context,
            title: 'BhaiGurdas.org',
            url: 'https://www.bhaigurdas.org',
          ),
          _customTextButton(
            context,
            title: 'Google Image Search',
            url: 'https://www.google.com/imghp?hl=en',
          ),
          Divider(),
          h6Text(context, 'Course Descriptions: '),
          _customTextButton(
            context,
            title: 'CollegeDunia.com',
            url: 'https://www.collegedunia.com/',
          ),
          Divider(),
          h6Text(context, 'Made Using: '),
          _customTextButton(
            context,
            title: 'Flutter',
            url: 'https://flutter.dev/',
          ),
          _customTextButton(
            context,
            title: 'Firebase',
            url: 'https://firebase.google.com/',
          ),
        ],
      ),
    );
  }

  _customTextButton(
    BuildContext context, {
    required String title,
    required String url,
  }) =>
      TextButton(
        child: Text(title),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => CustomAlertDialog(
              content:
                  'This will take you to an external link, Do you want to continue?',
              onPressed: () {
                Navigator.of(context).pop();
                CommonFunctions.launchURL(url, context);
              },
            ),
          );
        },
      );
}
