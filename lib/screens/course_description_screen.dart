import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CourseDescriptionScreen extends StatelessWidget {
  const CourseDescriptionScreen({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: name,
      ),
      body: Text(
        name,
        style: Theme.of(context).primaryTextTheme.bodyText1,
      ),
    );
  }
}
