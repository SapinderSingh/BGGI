import 'package:flutter/material.dart';

class CustomErrorDialog extends StatelessWidget {
  const CustomErrorDialog({
    Key? key,
    required this.contentText,
  }) : super(key: key);

  final String contentText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Error',
        style: Theme.of(context).primaryTextTheme.headline6,
      ),
      content: Text(
        contentText,
        style: Theme.of(context).primaryTextTheme.bodyText1,
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Okay'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
