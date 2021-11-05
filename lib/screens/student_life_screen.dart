import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class StudentLifeScreen extends StatelessWidget {
  const StudentLifeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Student Life',
        context: context,
      ),
      drawer: MainDrawer(),
    );
  }
}
