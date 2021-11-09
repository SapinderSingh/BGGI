import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Alert',
        style: Theme.of(context).primaryTextTheme.headline6,
      ),
      content: Text(
        'This will open a link which will download the required file. Do you want to continue ?',
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
