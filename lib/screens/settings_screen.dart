import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/helpers/constants.dart';
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
    final double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: customAppBar(context, title: 'Settings'),
      body: pressBackAgainToClose(
        child: ListView(
          children: [
            Consumer<ThemeManager>(
              builder: (context, theme, _) {
                return ListTile(
                  title: bodyText2(context, 'Select Theme'),
                  trailing: PopupMenuButton(
                    tooltip: 'Select Theme',
                    child: SizedBox(
                      width: _width / 2.94,
                      height: _width / 8.82,
                      child: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            bodyText1WithoutPadding(context, theme.themeName),
                            dynamicWidthSizedBox(context, width: 10),
                            Icon(
                              Icons.expand_more,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onSelected: theme.onThemeSelected,
                    itemBuilder: (context) => <PopupMenuEntry<AppTheme>>[
                      PopupMenuItem(
                        value: AppTheme.darkTheme,
                        child: bodyText1WithoutPadding(context, 'Dark Theme'),
                      ),
                      PopupMenuItem(
                        value: AppTheme.lightTheme,
                        child: bodyText1WithoutPadding(context, 'Light Theme'),
                      ),
                      PopupMenuItem(
                        value: AppTheme.systemTheme,
                        child: bodyText1WithoutPadding(context, 'System Theme'),
                      ),
                    ],
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: bodyText2(context, 'Licenses'),
              trailing: Icon(
                Icons.arrow_forward_sharp,
                color: Theme.of(context).iconTheme.color,
              ),
              onTap: () => showLicensePage(
                context: context,
                applicationName: 'BGGI',
                applicationVersion: '1.0.0',
                applicationLegalese: '© Copyright 2022',
                applicationIcon: Image.asset(
                  'assets/images/splash_image_light.png',
                ),
              ),
            ),
            const Divider(),
            ListTile(
              trailing: Icon(
                Icons.bug_report,
                color: Theme.of(context).iconTheme.color,
              ),
              onTap: () {},
              title: bodyText2(context, 'Report a bug'),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              title: bodyText2(context, 'Feature Request'),
            ),
            const Divider(),
            ListTile(
              onTap: () => Navigator.of(context).pushNamed(
                RouteConstants.creditsScreen,
              ),
              title: bodyText2(context, 'Credits'),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              title: bodyText2(context, 'Rate us on Play Store'),
            ),
            const Divider(),
            ListTile(
              title: bodyText2(context, 'App Version'),
              subtitle: const Text('1.0.0'),
            ),
          ],
        ),
      ),
    );
  }
}
