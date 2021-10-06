// ignore_for_file: prefer_const_constructors

import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
    );
  }
}
