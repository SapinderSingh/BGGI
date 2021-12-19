import 'package:bgiet/models/drawer_tile_model.dart';
import 'package:bgiet/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.separated(
        itemBuilder: (_, i) => CustomListTile(
          title: listOfDrawerTiles[i].name,
          haveTrailingIcon: false,
          isLink: false,
          placeToGoTo: listOfDrawerTiles[i].routeName,
          toBeReplaced: true,
          leading: Icon(listOfDrawerTiles[i].icon),
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: listOfDrawerTiles.length,
      ),
    );
  }
}
