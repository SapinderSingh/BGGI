import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/helpers/constants.dart';
import 'package:bgiet/models/course_model.dart';
import 'package:bgiet/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({
    Key? key,
    required this.departmentId,
  }) : super(key: key);

  final String departmentId;

  @override
  Widget build(BuildContext context) {
    final Course _course = Provider.of<Course>(context, listen: false);
    return Scaffold(
      appBar: customAppBar(context, title: 'Courses'),
      body: FutureBuilder<void>(
        future: _course.fetchAndAddCoursesToList(departmentId: departmentId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            if (_course.listOfCourses.isEmpty) {
              return const Center(
                child: Text('No Courses Added till now.'),
              );
            } else {
              return ListView.separated(
                itemBuilder: (_, index) {
                  final Course _courseModel = _course.listOfCourses[index];
                  return CustomListTile(
                    toBeReplaced: false,
                    title: _courseModel.title!,
                    isLink: false,
                    haveTrailingIcon: true,
                    placeToGoTo: RouteConstants.courseDetailScreen,
                    arguments: _courseModel.title,
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
                itemCount: _course.listOfCourses.length,
              );
            }
          }
        },
      ),
    );
  }
}
