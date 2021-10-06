import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(),
      body: const Center(
        child: Text('This screen is under development.'),
      ),
    );
  }
}
