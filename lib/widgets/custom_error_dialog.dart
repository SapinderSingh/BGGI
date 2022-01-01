import 'package:bgiet/helpers/common_widget_functions.dart';
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
      title: h6Text(context, 'Error'),
      content: bodyText2(
        context,
        contentText,
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
