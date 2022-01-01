import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:flutter/material.dart';

class MissionVisionScreen extends StatelessWidget {
  const MissionVisionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommonFunctions _commonFunction = CommonFunctions();
    return Scaffold(
      appBar: customAppBar(context, title: 'Mission & Vision'),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          _commonFunction.loadImageFromNetwork(
              'https://bhaigurdas.org/wp-content/uploads/2017/03/mission.jpg'),
          h4Text(context, 'Mission'),
          bodyText1(
            '''
1. To develop technical manpower of quality standards with capabilities of accepting new challenges.

2. To provide excellent teaching and research environment.

3. To promote collaborative coexistence amongst academic institute and industries for resource sharing.
          ''',
            context,
          ),
          _commonFunction.loadImageFromNetwork(
              'https://bhaigurdas.org/wp-content/uploads/2017/03/vision.jpg'),
          h4Text(context, 'Vision'),
          bodyText1(
            '''
To impart value based multidisciplinary quality education to the students which can enable them to contribute their knowledge in industrial development, technology revolution and economic growth of the nation with global perspective.
          ''',
            context,
          ),
          h4Text(context, 'Quality Policy'),
          bodyText1(
            '''
We are committed to provide and continually improve the healthy learning environment and supporting facilities for the students at Under Graduate and Post Graduate level to achieve academic excellence for better opportunities.
          ''',
            context,
          )
        ],
      ),
    );
  }
}
