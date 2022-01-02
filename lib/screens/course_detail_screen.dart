import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final Course _course = Provider.of<Course>(context, listen: false);
    final Course _requiredCourse = _course.listOfCourses.firstWhere(
      (course) => title == course.title,
    );
    return Scaffold(
      appBar: customAppBar(context, title: _requiredCourse.nickname!),
      body: ListView(
        padding: dynamicPadding(context, padding: 10),
        children: [
          CommonFunctions().loadImageFromNetwork(_requiredCourse.imageUrl!),
          dynamicHeightSizedBox(context, height: 10),
          h6Text(context, 'Description :'),
          bodyText1(_requiredCourse.description!, context),
          h6Text(context, 'Duration :'),
          bodyText1(_requiredCourse.courseDuration!, context),
        ],
      ),
    );
  }
}
