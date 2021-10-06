import 'package:bgiet/helpers/constants.dart';

class DrawerTile {
  final String name, routeName;

  DrawerTile({
    required this.name,
    required this.routeName,
  });
}

final List<DrawerTile> listOfTiles = [
  DrawerTile(
    name: "Home",
    routeName: '/',
  ),
  DrawerTile(
    name: "About Us",
    routeName: RouteConstants.aboutScreen,
  ),
  DrawerTile(
    name: "Academics",
    routeName: RouteConstants.academicsScreen,
  ),
  DrawerTile(
    name: "Courses",
    routeName: RouteConstants.coursesScreen,
  ),
  DrawerTile(
    name: "Admissions",
    routeName: RouteConstants.admissionsScreen,
  ),
  DrawerTile(
    name: "Student Life",
    routeName: RouteConstants.studentLifeScreen,
  ),
  DrawerTile(
    name: "Contact Us",
    routeName: RouteConstants.contactScreen,
  ),
  // DrawerTile(name:"Settings", routeName: RouteConstants.settingsScreen,),
  // "Settings",
  // "Contact",
];
