// ignore_for_file: prefer_const_constructors

import 'package:bgiet/helpers/constants.dart';
import 'package:bgiet/screens/about_screen.dart';
import 'package:bgiet/screens/academics_screen.dart';
import 'package:bgiet/screens/college_notice_screen.dart';
import 'package:bgiet/screens/contact_screen.dart';
import 'package:bgiet/screens/course_detail_screen.dart';
import 'package:bgiet/screens/courses_screen.dart';
import 'package:bgiet/screens/departments_screen.dart';
import 'package:bgiet/screens/downloads_screen.dart';
import 'package:bgiet/screens/home.dart';
import 'package:bgiet/screens/library_screen.dart';
import 'package:bgiet/screens/ptu_exam_webview.dart';
import 'package:bgiet/screens/settings_screen.dart';
import 'package:bgiet/screens/student_life_screen.dart';
import 'package:bgiet/screens/syllabus_screen.dart';
import 'package:bgiet/screens/university_websites.dart';
import 'package:bgiet/screens/unknown_screen.dart';
import 'package:bgiet/screens/view_pdf_screen.dart';
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
        final String _departmentId = _settings.arguments as String;
        return _pageGenerator(CoursesScreen(departmentId: _departmentId));
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
      case RouteConstants.courseDetailScreen:
        final String _courseTitle = _settings.arguments as String;
        return _pageGenerator(CourseDetailScreen(title: _courseTitle));
      case RouteConstants.ptuExamWebView:
        final String _url = _settings.arguments as String;
        return _pageGenerator(WebViewScreen(url: _url));
      case RouteConstants.studentLifeScreen:
        return _pageGenerator(StudentLifeScreen());
      case RouteConstants.libraryScreen:
        return _pageGenerator(LibraryScreen());
      case RouteConstants.departmentScreen:
        return _pageGenerator(DepartmentsScreen());
      case RouteConstants.universityDataScreen:
        return _pageGenerator(UniversityWebsites());
      case RouteConstants.collegeNoticeScreen:
        return _pageGenerator(CollegeNoticeScreen());
      case RouteConstants.viewPdfScreen:
        final Map<String, dynamic> _data =
            _settings.arguments as Map<String, dynamic>;
        return _pageGenerator(
            ViewPdfScreen(pdfName: _data['pdfName'], pdfUrl: _data['pdfUrl']));
      default:
        return _pageGenerator(UnknownScreen());
    }
  }

  static MaterialPageRoute _pageGenerator(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
