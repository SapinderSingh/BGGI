import 'package:bgiet/helpers/constants.dart';
import 'package:bgiet/models/branch_model.dart';
import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:bgiet/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BranchesScreen extends StatelessWidget {
  const BranchesScreen({
    Key? key,
    required this.courseId,
    required this.departmentId,
  }) : super(key: key);

  final String courseId, departmentId;

  @override
  Widget build(BuildContext context) {
    final Branch _branch = Provider.of<Branch>(context, listen: false);
    return Scaffold(
      appBar: customAppBar(title: 'Branches', context: context),
      body: FutureBuilder<void>(
        future: _branch.fetchAndAddBranchesToList(
          courseId: courseId,
          departmentId: departmentId,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return ListView.separated(
              itemBuilder: (ctx, i) => CustomListTile(
                title: _branch.listOfBranches[i].title!,
                haveTrailingIcon: true,
                isLink: false,
                placeToGoTo: RouteConstants.courseDescriptionScreen,
                arguments: _branch.listOfBranches[i].title,
                toBeReplaced: false,
              ),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: _branch.listOfBranches.length,
            );
          }
        },
      ),
    );
  }
}
