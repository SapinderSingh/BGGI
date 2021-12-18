import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {Key? key,
      required this.onPressed,
      this.content =
          "This will open a link which will download the required file. Do you want to continue ?"})
      : super(key: key);

  final Function()? onPressed;
  final String content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Alert',
        style: Theme.of(context).primaryTextTheme.headline6,
      ),
      content: Text(
        content,
        style: Theme.of(context).primaryTextTheme.bodyText1,
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Yes'),
          onPressed: onPressed,
        ),
        TextButton(
          child: const Text('No'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
