import 'package:bgiet/helpers/constants.dart';

class AcademicScreenModel {
  final String name;
  final String routeName;

  AcademicScreenModel({
    required this.name,
    required this.routeName,
  });

  static List<AcademicScreenModel> get listOfAcademicTiles =>
      [..._listOfAcademicTiles];

  static final List<AcademicScreenModel> _listOfAcademicTiles = [
    AcademicScreenModel(
      name: "Departments",
      routeName: RouteConstants.departmentScreen,
    ),
    AcademicScreenModel(
      name: "Syllabus",
      routeName: RouteConstants.syllabusScreen,
    ),
    AcademicScreenModel(
      name: "Downloads",
      routeName: RouteConstants.downloadsScreen,
    ),
    AcademicScreenModel(
      name: "Library",
      routeName: RouteConstants.libraryScreen,
    ),
  ];
}
