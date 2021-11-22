import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/models/branch_model.dart';
import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BranchDetailScreen extends StatelessWidget {
  const BranchDetailScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final Branch _branch = Provider.of<Branch>(context, listen: false);
    CommonFunctions _commonFunction = CommonFunctions();
    final _requiredBranch = _branch.listOfBranches.firstWhere(
      (branch) => title == branch.title,
    );
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: title,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          _commonFunction.loadImageFromNetwork(
            _requiredBranch.imageLink!,
          ),
          const SizedBox(height: 10),
          Text(
            _requiredBranch.description!,
            style: Theme.of(context).primaryTextTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
