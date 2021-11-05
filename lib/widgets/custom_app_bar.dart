import 'package:flutter/material.dart';

AppBar customAppBar({
  required String title,
  required BuildContext context,
}) =>
    AppBar(
      title: Text(
        title,
      ),
    );
