import 'package:bgiet/helpers/common_widget_functions.dart';
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
      title: h6Text(context, 'Alert'),
      content: bodyText1WithoutPadding(context, content),
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
