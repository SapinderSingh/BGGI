import 'package:bgiet/models/courses_model.dart';
import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:bgiet/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'Courses',
      ),
      body: ListView.separated(
        itemBuilder: (_, index) => CustomListTile(
          title: Course.listOfCourses[index].name,
          isLink: false,
          haveTrailingIcon: false,
          placeToGoTo: '',
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: Course.listOfCourses.length,
      ),
    );
  }
}
