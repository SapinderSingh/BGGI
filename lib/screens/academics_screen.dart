import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/models/academic_screen_model.dart';
import 'package:bgiet/models/department_model.dart';
import 'package:bgiet/widgets/custom_list_tile.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AcademicsScreen extends StatelessWidget {
  const AcademicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<AcademicScreenModel> _listOfAcademicsTiles =
        AcademicScreenModel.listOfAcademicTiles;
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: customAppBar(context, title: 'Academics'),
      body: pressBackAgainToClose(
        child: FutureBuilder<void>(
          future: Provider.of<Department>(context, listen: false)
              .fetchAndAddDepartmentsToList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return bodyText2(context, snapshot.error.toString());
            } else {
              return ListView.separated(
                separatorBuilder: (_, __) => const Divider(),
                itemCount: _listOfAcademicsTiles.length,
                itemBuilder: (_, index) => CustomListTile(
                  toBeReplaced: false,
                  title: _listOfAcademicsTiles[index].name,
                  haveTrailingIcon: true,
                  isLink: false,
                  placeToGoTo: _listOfAcademicsTiles[index].routeName,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
