import 'package:bgiet/models/student_life_screen_data.dart';
import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:bgiet/widgets/custom_list_tile.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:bgiet/widgets/press_back_again_to_close.dart';
import 'package:flutter/material.dart';

class StudentLifeScreen extends StatelessWidget {
  const StudentLifeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: customAppBar(
        title: 'Student Life',
        context: context,
      ),
      body: pressBackAgainToClose(
        child: ListView.separated(
          itemBuilder: (_, i) {
            List<StudentLifeScreenData> _listOfData =
                StudentLifeScreenData.listOfStudentLifeData;

            return CustomListTile(
              title: _listOfData[i].title!,
              haveTrailingIcon: true,
              isLink: false,
              placeToGoTo: _listOfData[i].routeName!,
              toBeReplaced: false,
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: StudentLifeScreenData.listOfStudentLifeData.length,
        ),
      ),
    );
  }
}
