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

  Image loadImageFromNetwork(String imageLink) {
    return Image.network(
      imageLink,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.none,
      errorBuilder: (_, Object exception, StackTrace? stackTrace) {
        return const Center(
          child: Text('Failed to load image'),
        );
      },
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
