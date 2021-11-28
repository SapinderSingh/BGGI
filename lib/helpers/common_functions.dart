import 'dart:io';

import 'package:bgiet/widgets/custom_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

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

  CachedNetworkImage loadImageFromNetwork(String imageLink) {
    return CachedNetworkImage(
      imageUrl: imageLink,
      filterQuality: FilterQuality.none,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Text('Error while loading the image'),
      ),
    );
  }

  Padding descriptionText(String text, BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(context).primaryTextTheme.bodyText1,
        ),
      );
}
