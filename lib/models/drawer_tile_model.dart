import 'package:bgiet/helpers/constants.dart';

class DrawerTile {
  final String name, routeName;

  DrawerTile({
    required this.name,
    required this.routeName,
  });
}

final List<DrawerTile> listOfDrawerTiles = [
  DrawerTile(
    name: "Home",
    routeName: '/',
  ),
  DrawerTile(
    name: "Academics",
    routeName: RouteConstants.academicsScreen,
  ),
  DrawerTile(
    name: "Downloads",
    routeName: RouteConstants.downloadsScreen,
  ),
  DrawerTile(
    name: "Student Life",
    routeName: RouteConstants.studentLifeScreen,
  ),
  DrawerTile(
    name: "Settings",
    routeName: RouteConstants.settingsScreen,
  ),
  DrawerTile(
    name: "PTU Exam",
    routeName: RouteConstants.ptuExamWebView,
  ),
  DrawerTile(
    name: "About Us",
    routeName: RouteConstants.aboutScreen,
  ),
  DrawerTile(
    name: "Contact Us",
    routeName: RouteConstants.contactScreen,
  ),
];
