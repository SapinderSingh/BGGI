import 'package:bgiet/helpers/constants.dart';
import 'package:flutter/material.dart';

class DrawerTile {
  final String name, routeName;
  final IconData icon;
  DrawerTile({
    required this.name,
    required this.routeName,
    required this.icon,
  });
}

final List<DrawerTile> listOfDrawerTiles = [
  DrawerTile(
    name: "Home",
    routeName: '/',
    icon: Icons.home,
  ),
  DrawerTile(
    name: "Academics",
    routeName: RouteConstants.academicsScreen,
    icon: Icons.school,
  ),
  DrawerTile(
    name: "Student Life",
    routeName: RouteConstants.studentLifeScreen,
    icon: Icons.people,
  ),
  DrawerTile(
    name: 'College Notices',
    routeName: RouteConstants.collegeNoticeScreen,
    icon: Icons.assignment,
  ),
  DrawerTile(
    name: "University Websites",
    routeName: RouteConstants.universityDataScreen,
    icon: Icons.web,
  ),
  DrawerTile(
    name: "Settings",
    routeName: RouteConstants.settingsScreen,
    icon: Icons.settings,
  ),
  DrawerTile(
    name: 'Enquiry',
    routeName: RouteConstants.enquiryScreen,
    icon: Icons.mail,
  ),
  DrawerTile(
    name: "Contact Us",
    routeName: RouteConstants.contactScreen,
    icon: Icons.phone,
  ),
  DrawerTile(
    name: "About Us",
    routeName: RouteConstants.aboutUsScreen,
    icon: Icons.info,
  ),
];
