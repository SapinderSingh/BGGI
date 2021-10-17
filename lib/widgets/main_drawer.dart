// ignore_for_file: prefer_const_constructors
import 'package:bgiet/helpers/constants.dart';
import 'package:bgiet/models/drawer_tile_model.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.amber[50],
      ),
      child: Drawer(
        child: Column(
          children: List.generate(
            listOfTiles.length,
            (int i) {
              if (i == 0) {
                return SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        radius: 60,
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pushNamed(
                          RouteConstants.viewProfileScreen,
                        ),
                        child: Text('View Profile'),
                      ),
                      _DrawerTile(
                        name: listOfTiles[i].name,
                        routeName: listOfTiles[i].routeName,
                      ),
                    ],
                  ),
                );
              } else {
                return _DrawerTile(
                  name: listOfTiles[i].name,
                  routeName: listOfTiles[i].routeName,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  final String name;
  final String routeName;
  const _DrawerTile({
    required this.name,
    required this.routeName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(routeName);
      },
      title: Text(
        name,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
