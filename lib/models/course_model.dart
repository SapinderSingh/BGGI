import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Course with ChangeNotifier {
  final String? description, imageUrl, nickname, title, courseDuration, id;

  Course({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.nickname,
    this.courseDuration,
  });

  final List<Course> _listOfCourses = [];

  List<Course> get listOfCourses => [..._listOfCourses];

  Course findCourseByTitle(String title) =>
      _listOfCourses.firstWhere((course) => course.title == title);

  Future<void> fetchAndAddCoursesToList({required String departmentId}) async {
    CollectionReference _courses = FirebaseFirestore.instance
        .collection('departments/$departmentId/courses');

    final QuerySnapshot<Object?> _coursesSnapshot =
        await _courses.orderBy('title').get();

    _listOfCourses.clear();

    _coursesSnapshot.docs.toList().forEach(
      (_fetchedData) {
        final Map<String, dynamic> _convertedData =
            _fetchedData.data() as Map<String, dynamic>;
        _listOfCourses.add(
          Course(
            id: _fetchedData.id,
            courseDuration: _convertedData['courseDuration'],
            title: _convertedData['title'],
            description: _convertedData['description'],
            imageUrl: _convertedData['imageUrl'],
            nickname: _convertedData['nickname'],
          ),
        );
      },
    );
  }
}
