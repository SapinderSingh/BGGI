import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/models/course_model.dart';
import 'package:bgiet/widgets/custom_app_bar.dart';
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
    CommonFunctions _commonFunction = CommonFunctions();
    final Course _course = Provider.of<Course>(context, listen: false);
    final Course _requiredCourse = _course.listOfCourses.firstWhere(
      (course) => title == course.title,
    );
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: _requiredCourse.nickname!,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          _commonFunction.loadImageFromNetwork(
            _requiredCourse.imageUrl!,
          ),
          const SizedBox(height: 10),
          Text(
            'Description :',
            style: Theme.of(context).primaryTextTheme.headline6,
          ),
          _commonFunction.descriptionText(
            _requiredCourse.description!,
            context,
          ),
          Text(
            'Duration :',
            style: Theme.of(context).primaryTextTheme.headline6,
          ),
          _commonFunction.descriptionText(
            _requiredCourse.courseDuration!,
            context,
          ),
        ],
      ),
    );
  }
}
