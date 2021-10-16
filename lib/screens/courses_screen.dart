// ignore_for_file: prefer_const_constructors

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
          name: Course.listOfCourses[index].name,
        ),
        separatorBuilder: (_, __) => Divider(),
        itemCount: Course.listOfCourses.length,
      ),
    );
  }
}

class _CoursesListItem extends StatelessWidget {
  final String name;
  const _CoursesListItem({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
    );
  }
}
