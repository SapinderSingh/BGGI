import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/models/university_screen_data.dart';
import 'package:bgiet/widgets/custom_alert_dialog.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class UniversityWebsites extends StatelessWidget {
  const UniversityWebsites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: customAppBar(context, title: 'University Websites'),
      body: pressBackAgainToClose(
        child: ListView.separated(
          separatorBuilder: (_, __) => const Divider(),
          itemCount: UniversityScreenData.universityScreenDataList.length,
          itemBuilder: (_, i) {
            final List<UniversityScreenData> _unvDataList =
                UniversityScreenData.universityScreenDataList;
            return ListTile(
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => showDialog(
                context: context,
                builder: (_) => CustomAlertDialog(
                  content:
                      'This will open a link in your browser. Do you want to continue ?',
                  onPressed: () {
                    CommonFunctions.launchURL(
                      _unvDataList[i].url!,
                      context,
                    );
                    Navigator.of(context).pop();
                  },
                ),
              ),
              title: Text(_unvDataList[i].title!),
              subtitle: Text(_unvDataList[i].departmentName!),
            );
          },
        ),
      ),
    );
  }
}
