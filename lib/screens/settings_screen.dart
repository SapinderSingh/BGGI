import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:bgiet/widgets/press_back_again_to_close.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: customAppBar(
        context: context,
        title: 'Settings',
      ),
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
