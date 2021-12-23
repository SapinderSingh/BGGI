import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/helpers/constants.dart';
import 'package:bgiet/widgets/custom_list_tile.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: customAppBar(context, title: 'About Us'),
      body: pressBackAgainToClose(
        child: ListView(
          children: const [
            CustomListTile(
              title: 'Founder\'s Desk',
              haveTrailingIcon: true,
              isLink: false,
              placeToGoTo: RouteConstants.authorityDetailScreen,
              toBeReplaced: false,
              arguments: 'Founder\'s Desk',
            ),
            Divider(),
            CustomListTile(
              title: 'Chairman\'s Desk',
              haveTrailingIcon: true,
              isLink: false,
              placeToGoTo: RouteConstants.authorityDetailScreen,
              toBeReplaced: false,
              arguments: 'Chairman\'s Desk',
            ),
            Divider(),
            CustomListTile(
              title: 'Dean\'s Desk',
              haveTrailingIcon: true,
              isLink: false,
              placeToGoTo: RouteConstants.authorityDetailScreen,
              toBeReplaced: false,
              arguments: 'Dean\'s Desk',
            ),
            Divider(),
            CustomListTile(
              title: 'Mission & Vision',
              haveTrailingIcon: true,
              isLink: false,
              placeToGoTo: RouteConstants.missionVisionScreen,
              toBeReplaced: false,
            ),
            Divider(),
            CustomListTile(
              title: 'About',
              haveTrailingIcon: true,
              isLink: false,
              placeToGoTo: RouteConstants.aboutScreen,
              toBeReplaced: false,
            ),
          ],
        ),
      ),
    );
  }
}
