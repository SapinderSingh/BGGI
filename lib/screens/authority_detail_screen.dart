import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/models/about_screen_data.dart';
import 'package:flutter/material.dart';

class AuthorityDetailScreen extends StatelessWidget {
  const AuthorityDetailScreen({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final AboutScreenData _aboutScreenData =
        AboutScreenData.findDataByTitle(title);
    return Scaffold(
      appBar: customAppBar(context, title: _aboutScreenData.title!),
      body: ListView(
        padding: dynamicPadding(context, padding: 10),
        children: [
          CommonFunctions().loadImageFromNetwork(_aboutScreenData.imageUrl!),
          h4Text(context, _aboutScreenData.name!),
          bodyText1('${_aboutScreenData.message}', context),
        ],
      ),
    );
  }
}
