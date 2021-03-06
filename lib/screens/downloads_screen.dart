import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/models/download_model.dart';
import 'package:bgiet/widgets/custom_list_tile.dart';

import 'package:flutter/material.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listOfDownloads = Download.getDownloads;
    return Scaffold(
      appBar: customAppBar(context, title: 'Downloads'),
      body: ListView.separated(
        itemBuilder: (_, i) => CustomListTile(
          toBeReplaced: false,
          title: listOfDownloads[i].name,
          placeToGoTo: listOfDownloads[i].url,
          isLink: true,
          haveTrailingIcon: true,
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: listOfDownloads.length,
      ),
    );
  }
}
