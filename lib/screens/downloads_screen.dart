import 'package:bgiet/models/download_model.dart';
import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:bgiet/widgets/custom_list_tile.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listOfDownloads = Download.getDownloads;
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: customAppBar(
        context: context,
        title: 'Downloads',
      ),
      body: ListView.separated(
        itemBuilder: (_, i) => CustomListTile(
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
