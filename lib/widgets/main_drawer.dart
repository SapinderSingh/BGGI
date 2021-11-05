// ignore_for_file: prefer_const_constructors
// import 'package:bgiet/helpers/constants.dart';
import 'package:bgiet/models/drawer_tile_model.dart';
import 'package:bgiet/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Drawer(
    //   child: Column(
    //     children: List.generate(listOfDrawerTiles.length, (int i) {
    // if (i == 0) {
    //   return SafeArea(
    //     child: Column(
    //       children: [
    //         SizedBox(
    //           height: 20,
    //         ),
    //         CircleAvatar(
    //           radius: 60,
    //         ),
    //         TextButton(
    //           onPressed: () => Navigator.of(context).pushNamed(
    //             RouteConstants.viewProfileScreen,
    //           ),
    //           child: Text('View Profile'),
    //         ),
    //         CustomListTile(
    //           toBeReplaced: true,
    //           isLink: false,
    //           haveTrailingIcon: false,
    //           title: listOfDrawerTiles[i].name,
    //           placeToGoTo: listOfDrawerTiles[i].routeName,
    //         ),
    //       ],
    //     ),
    //   );
    // } else {
    //         return CustomListTile(
    //           toBeReplaced: true,
    //           isLink: false,
    //           haveTrailingIcon: false,
    //           title: listOfDrawerTiles[i].name,
    //           placeToGoTo: listOfDrawerTiles[i].routeName,
    //         );
    //       }
    //           // },
    //           ),
    //     ),
    //   );

    return Drawer(
      child: ListView.separated(
        itemBuilder: (_, i) => CustomListTile(
          title: listOfDrawerTiles[i].name,
          haveTrailingIcon: false,
          isLink: false,
          placeToGoTo: listOfDrawerTiles[i].routeName,
          toBeReplaced: true,
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: listOfDrawerTiles.length,
      ),
    );
  }
}
