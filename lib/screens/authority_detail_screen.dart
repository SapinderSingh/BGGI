import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/models/about_screen_data.dart';
import 'package:flutter/material.dart';

class AuthorityDetailScreen extends StatelessWidget {
  const AuthorityDetailScreen({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final AboutScreenData _aboutScreenData =
        AboutScreenData.listOfAboutScreenData.firstWhere(
      (element) => element.title == title,
    );
    return Scaffold(
      appBar: customAppBar(context, title: _aboutScreenData.title!),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          CommonFunctions().loadImageFromNetwork(
            _aboutScreenData.imageUrl!,
          ),
          Text(
            _aboutScreenData.name!,
            style: Theme.of(context).primaryTextTheme.headline4,
          ),
          const SizedBox(height: 10),
          Text(
            '${_aboutScreenData.message}',
            style: Theme.of(context).primaryTextTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
