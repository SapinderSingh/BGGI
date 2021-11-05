import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: customAppBar(
        title: 'Unknown',
        context: context,
      ),
      body: const Center(
        child: Text('This screen is under development.'),
      ),
    );
  }
}
