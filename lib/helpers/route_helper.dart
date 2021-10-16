// ignore_for_file: prefer_const_constructors

import 'package:bgiet/helpers/constants.dart';
import 'package:bgiet/screens/about_screen.dart';
import 'package:bgiet/screens/academics_screen.dart';
import 'package:bgiet/screens/contact_screen.dart';
import 'package:bgiet/screens/courses_screen.dart';
import 'package:bgiet/screens/home.dart';
import 'package:bgiet/screens/unknown_screen.dart';
import 'package:bgiet/screens/view_profile_screen.dart';
import 'package:flutter/material.dart';

class RouteHelper {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.aboutScreen:
        return _pageGenerator(AboutScreen());
      case '/':
        return _pageGenerator(Home());
      case RouteConstants.coursesScreen:
        return _pageGenerator(CoursesScreen());
      case RouteConstants.viewProfileScreen:
        return _pageGenerator(ViewProfileScreen());
      case RouteConstants.contactScreen:
        return _pageGenerator(ContactScreen());
      case RouteConstants.academicsScreen:
        return _pageGenerator(AcademicsScreen());
      default:
        return _pageGenerator(UnknownScreen());
    }
  }

  static MaterialPageRoute _pageGenerator(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
