import 'package:bgiet/helpers/common_widget_functions.dart';

import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: customAppBar(context, title: 'Settings'),
      body: pressBackAgainToClose(
        child: ListView(
          children: [
            SwitchListTile(
              title: Text(
                'Dark Theme',
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
              value: true,
              onChanged: (_) {},
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
