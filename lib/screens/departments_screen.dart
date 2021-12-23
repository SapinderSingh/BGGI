import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/helpers/constants.dart';
import 'package:bgiet/models/department_model.dart';
import 'package:bgiet/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DepartmentsScreen extends StatelessWidget {
  const DepartmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Department _department =
        Provider.of<Department>(context, listen: false);
    return Scaffold(
      appBar: customAppBar(context, title: 'Departments'),
      body: ListView.separated(
        itemBuilder: (_, i) => CustomListTile(
          title: _department.listOfDepartments[i].title!,
          haveTrailingIcon: true,
          isLink: false,
          placeToGoTo: RouteConstants.coursesScreen,
          toBeReplaced: false,
          arguments: _department.listOfDepartments[i].id,
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: _department.listOfDepartments.length,
      ),
    );
  }
}
