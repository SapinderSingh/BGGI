import 'package:bgiet/models/academic_screen_model.dart';
import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:bgiet/widgets/custom_list_tile.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:bgiet/widgets/press_back_again_to_close.dart';
import 'package:flutter/material.dart';

class AcademicsScreen extends StatelessWidget {
  const AcademicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _listOfAcademicsTiles = AcademicScreenModel.listOfAcademicTiles;
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: customAppBar(
        context: context,
        title: 'Academics',
      ),
      body: pressBackAgainToClose(
        child: ListView.separated(
          separatorBuilder: (_, __) => const Divider(),
          itemCount: _listOfAcademicsTiles.length,
          itemBuilder: (_, index) =>
              _listOfAcademicsTiles[index].routeName == null
                  ? CustomListTile(
                      toBeReplaced: false,
                      haveTrailingIcon: true,
                      isLink: true,
                      placeToGoTo: _listOfAcademicsTiles[index].url!,
                      title: _listOfAcademicsTiles[index].name,
                    )
                  : CustomListTile(
                      toBeReplaced: false,
                      title: _listOfAcademicsTiles[index].name,
                      haveTrailingIcon: true,
                      isLink: false,
                      placeToGoTo: _listOfAcademicsTiles[index].routeName!,
                    ),
        ),
      ),
    );
  }
}
