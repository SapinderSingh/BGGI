import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/widgets/carsoul_slider.dart';
import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:bgiet/widgets/press_back_again_to_close.dart';
import 'package:flutter/material.dart';

class StudentLifeScreen extends StatelessWidget {
  const StudentLifeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommonFunctions _commonFunction = CommonFunctions();
    final List<Image> _listOfAthleticImages = [
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/ath1.jpg',
      ),
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/ath3.jpg',
      ),
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/ath2.jpg',
      ),
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/ath4.jpg',
      ),
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/ath8.jpg',
      ),
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/ath7.jpg',
      ),
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/ath6.jpg',
      ),
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/ath5.jpg',
      ),
    ];

    final List<Image> _listOfHousingImages = [
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/boy3.jpg',
      ),
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/boy2.jpg',
      ),
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/boy4-1.jpg',
      ),
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/boy5.jpg',
      ),
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/boy1.jpg',
      ),
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/boy6.jpg',
      ),
    ];

    final List<Image> _listOfDiningImages = [
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/girl4.jpg',
      ),
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/girl3.jpg',
      ),
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/girl5.jpg',
      ),
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/girl7.jpg',
      ),
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/girl6.jpg',
      ),
      _commonFunction.loadImageFromNetwork(
        'https://bgiet.ac.in/wp-content/uploads/2017/05/girl1.jpg',
      ),
    ];
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: customAppBar(
        title: 'Student Life',
        context: context,
      ),
      body: pressBackAgainToClose(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Text(
              'Athletics & Recreation',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
            const SizedBox(height: 10),
            customCarouselSlider(_listOfAthleticImages),
            const SizedBox(height: 20),
            Text(
              'Housing & Dining',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
            const SizedBox(height: 10),
            customCarouselSlider(_listOfHousingImages),
            const SizedBox(height: 20),
            customCarouselSlider(_listOfDiningImages),
          ],
        ),
      ),
    );
  }
}
