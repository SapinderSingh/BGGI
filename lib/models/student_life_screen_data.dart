import 'package:bgiet/helpers/constants.dart';

class StudentLifeScreenData {
  final String? title, routeName;

  StudentLifeScreenData({this.routeName, this.title});

  static final List<StudentLifeScreenData> _listOfStudentLifeData = [
    StudentLifeScreenData(
      routeName: RouteConstants.photoGalleryScreen,
      title: 'Photo Gallery',
    ),
    StudentLifeScreenData(
      routeName: RouteConstants.facilitiesScreen,
      title: 'Facilites',
    ),
  ];

  static List<StudentLifeScreenData> get listOfStudentLifeData =>
      [..._listOfStudentLifeData];
}
