import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Course with ChangeNotifier {
  final String? title, id;

  Course({this.title, this.id});

  final List<Course> _listOfCourses = [];

  List<Course> get listOfCourses => [..._listOfCourses];

  Future<void> fetchAndAddCoursesToList({required String departmentId}) async {
    CollectionReference _courses = FirebaseFirestore.instance
        .collection('departments/$departmentId/courses/');
    final QuerySnapshot<Object?> _coursesSnapshot = await _courses.get();
    _listOfCourses.clear();

    _coursesSnapshot.docs.toList().forEach(
      (QueryDocumentSnapshot<Object?> _fetchedData) async {
        final Map<String, dynamic> _convertedData =
            _fetchedData.data() as Map<String, dynamic>;

        _listOfCourses.add(
          Course(
            title: _convertedData['title'],
            id: _fetchedData.id,
          ),
        );
      },
    );
  }
}
