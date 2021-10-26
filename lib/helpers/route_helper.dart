// ignore_for_file: prefer_const_constructors

import 'package:bgiet/helpers/constants.dart';
import 'package:bgiet/screens/about_screen.dart';
import 'package:bgiet/screens/academics_screen.dart';
import 'package:bgiet/screens/contact_screen.dart';
import 'package:bgiet/screens/course_description_screen.dart';
import 'package:bgiet/screens/courses_screen.dart';
import 'package:bgiet/screens/downloads_screen.dart';
import 'package:bgiet/screens/home.dart';
import 'package:bgiet/screens/ptu_exam_webview.dart';
import 'package:bgiet/screens/settings_screen.dart';
import 'package:bgiet/screens/syllabus_screen.dart';
import 'package:bgiet/screens/unknown_screen.dart';
import 'package:bgiet/screens/view_profile_screen.dart';
import 'package:flutter/material.dart';

class RouteHelper {
  static Route<dynamic> onGenerateRoute(RouteSettings _settings) {
    switch (_settings.name) {
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
      case RouteConstants.settingsScreen:
        return _pageGenerator(SettingsScreen());
      case RouteConstants.syllabusScreen:
        return _pageGenerator(SyllabusScreen());
      case RouteConstants.downloadsScreen:
        return _pageGenerator(DownloadsScreen());
      case RouteConstants.courseDescriptionScreen:
        final String _name = _settings.arguments as String;
        return _pageGenerator(CourseDescriptionScreen(name: _name));
      case RouteConstants.ptuExamWebView:
        return _pageGenerator(PTUExamWebView());
      default:
        return _pageGenerator(UnknownScreen());
    }
  }

  static MaterialPageRoute _pageGenerator(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
