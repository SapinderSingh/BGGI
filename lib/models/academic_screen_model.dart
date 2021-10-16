import 'package:bgiet/helpers/constants.dart';

class AcademicScreenModel {
  final String name;
  final String? routeName, url;

  AcademicScreenModel({
    required this.name,
    required this.routeName,
    required this.url,
  });

  static List<AcademicScreenModel> get listOfAcademicTiles =>
      [..._listOfAcademicTiles];

  static final List<AcademicScreenModel> _listOfAcademicTiles = [
    AcademicScreenModel(
      name: "Courses",
      routeName: RouteConstants.coursesScreen,
      url: null,
    ),
    AcademicScreenModel(
      name: "Fee Structure",
      routeName: null,
      url:
          "https://ptu.ac.in/wp-content/uploads/2020/10/Fee-Structure-of-AICTE-Courses-for-Session-2020-21.pdf",
    ),
    AcademicScreenModel(
      name: "Eligibility",
      routeName: null,
      url:
          "https://ptu.ac.in/wp-content/uploads/2020/09/Eligibility-Criteria-2019-20-AICTE-Course-23-09-2019.pdf",
    ),
    AcademicScreenModel(
      name: "Syllabus",
      routeName: RouteConstants.syllabusScreen,
      url: null,
    ),
    AcademicScreenModel(
      name: "BGIET Faculty",
      routeName: RouteConstants.facultyScreen,
      url: null,
    ),
    AcademicScreenModel(
      name: "Downloads",
      routeName: RouteConstants.downloadScreen,
      url: null,
    ),
  ];
}
