import 'dart:io';

import 'package:bgiet/widgets/custom_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonFunctions {
  static void launchURL(String url, BuildContext context) async {
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        await canLaunch(url)
            ? await launch(url)
            : throw Exception('Unable to launch this URL');
      }
    } on SocketException catch (_) {
      showDialog(
        context: context,
        builder: (_) => const CustomErrorDialog(
          contentText: 'Please check your internet connection',
        ),
      );
    } on Exception catch (e) {
      showDialog(
        context: context,
        builder: (_) => CustomErrorDialog(
          contentText: e.toString(),
        ),
      );
    }
  }
}
