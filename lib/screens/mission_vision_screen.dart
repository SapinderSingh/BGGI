import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MissionVisionScreen extends StatelessWidget {
  const MissionVisionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommonFunctions _commonFunction = CommonFunctions();
    return Scaffold(
      appBar: customAppBar(
        title: 'Mission & Vision',
        context: context,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          _commonFunction.loadImageFromNetwork(
              'https://bhaigurdas.org/wp-content/uploads/2017/03/mission.jpg'),
          Text(
            'Mission',
            style: Theme.of(context).primaryTextTheme.headline4,
          ),
          Text(
            '''
1. To develop technical manpower of quality standards with capabilities of accepting new challenges.

2. To provide excellent teaching and research environment.

3. To promote collaborative coexistence amongst academic institute and industries for resource sharing.
          ''',
            style: Theme.of(context).primaryTextTheme.bodyText1,
          ),
          _commonFunction.loadImageFromNetwork(
              'https://bhaigurdas.org/wp-content/uploads/2017/03/vision.jpg'),
          Text(
            'Vision',
            style: Theme.of(context).primaryTextTheme.headline4,
          ),
          Text(
            '''
To impart value based multidisciplinary quality education to the students which can enable them to contribute their knowledge in industrial development, technology revolution and economic growth of the nation with global perspective.
          ''',
            style: Theme.of(context).primaryTextTheme.bodyText1,
          ),
          Text(
            'Quality Policy',
            style: Theme.of(context).primaryTextTheme.headline4,
          ),
          Text(
            '''
We are committed to provide and continually improve the healthy learning environment and supporting facilities for the students at Under Graduate and Post Graduate level to achieve academic excellence for better opportunities.
          ''',
            style: Theme.of(context).primaryTextTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
