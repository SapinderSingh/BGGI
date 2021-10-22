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
      appBar: AppBar(
        title: Text(name),
      ),
      body: Text(name),
    );
  }
}
