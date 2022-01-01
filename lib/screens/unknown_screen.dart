import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: customAppBar(context, title: 'Unknown'),
      body: Center(
        child: bodyText2(context, 'This screen is under development.'),
      ),
    );
  }
}
