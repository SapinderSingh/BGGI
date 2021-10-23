import 'package:bgiet/helpers/constants.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listOfDownloads = Download.getDownloads;
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Downloads'),
      ),
      body: ListView.separated(
        itemBuilder: (_, i) => DownloadListTile(
          name: listOfDownloads[i].name,
          url: listOfDownloads[i].url,
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: listOfDownloads.length,
      ),
    );
  }
}

class DownloadListTile extends StatelessWidget {
  const DownloadListTile({
    Key? key,
    required this.name,
    required this.url,
  }) : super(key: key);
  final String name, url;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _launchURL(url),
      title: Text(name),
    );
  }

  void _launchURL(String url) async {
    // TODO: Error handling
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }
}
