import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

pressBackAgainToClose({
  required Widget child,
}) {
  return DoubleBackToCloseApp(
    snackBar: const SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        'Press back again to close',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    child: child,
  );
}
