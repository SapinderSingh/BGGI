// ignore_for_file: prefer_const_constructors

import 'package:bgiet/helpers/constants.dart';
import 'package:bgiet/models/courses_model.dart';
import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: ListView.separated(
        itemBuilder: (_, index) => _CoursesListItem(
          courseName: Course.listOfCourses[index].name,
        ),
        separatorBuilder: (_, __) => Divider(),
        itemCount: Course.listOfCourses.length,
      ),
    );
  }
}

class _CoursesListItem extends StatelessWidget {
  final String courseName;
  const _CoursesListItem({
    Key? key,
    required this.courseName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).pushNamed(
        RouteConstants.courseDescriptionScreen,
        arguments: courseName,
      ),
      title: Text(courseName),
    );
  }
}
