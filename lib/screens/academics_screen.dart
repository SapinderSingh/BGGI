import 'package:bgiet/models/academic_screen_model.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AcademicsScreen extends StatelessWidget {
  const AcademicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _listOfAcademicsTiles = AcademicScreenModel.listOfAcademicTiles;
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: const Text('Academics'),
      ),
      body: ListView.separated(
        itemBuilder: (_, index) => AcademicListTile(
          routeName: _listOfAcademicsTiles[index].routeName,
          name: _listOfAcademicsTiles[index].name,
          url: _listOfAcademicsTiles[index].url,
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: _listOfAcademicsTiles.length,
      ),
    );
  }
}

class AcademicListTile extends StatelessWidget {
  const AcademicListTile({
    Key? key,
    required this.routeName,
    required this.name,
    required this.url,
  }) : super(key: key);
  final String name;
  final String? routeName, url;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      trailing: const Icon(
        Icons.arrow_forward,
        color: Colors.black,
      ),
      onTap: () => routeName == null
          ? _launchURL(url!)
          : Navigator.of(context).pushNamed(routeName!),
    );
  }

  void _launchURL(String url) async {
    // TODO: Error handling
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }
}
