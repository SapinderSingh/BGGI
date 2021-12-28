import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/helpers/theme_manager.dart';

import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AppTheme {
  lightTheme,
  darkTheme,
  systemTheme,
}

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
            Consumer<ThemeManager>(
              builder: (context, theme, _) {
                return ListTile(
                  title: const Text('Select Theme'),
                  trailing: PopupMenuButton(
                    tooltip: 'Select Theme',
                    child: SizedBox(
                      width: 140,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(theme.themeName),
                          const SizedBox(width: 10),
                          const Icon(Icons.expand_more),
                        ],
                      ),
                    ),
                    onSelected: theme.onThemeSelected,
                    itemBuilder: (context) => const [
                      PopupMenuItem(
                        value: AppTheme.darkTheme,
                        child: Text('Dark Theme'),
                      ),
                      PopupMenuItem(
                        value: AppTheme.lightTheme,
                        child: Text('Light Theme'),
                      ),
                      PopupMenuItem(
                        value: AppTheme.systemTheme,
                        child: Text('System Theme'),
                      ),
                    ],
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: Text('Report a bug'),
            ),
            const Divider(),
            ListTile(
              title: Text('License'),
            ),
            const Divider(),
            ListTile(
              title: Text('Feature Request'),
            ),
            const Divider(),
            const ListTile(
              title: Text('App Version'),
              subtitle: Text('1.0.0'),
            ),
          ],
        ),
      ),
    );
  }
}
