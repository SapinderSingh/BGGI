import 'package:bgiet/widgets/carsoul_slider.dart';
import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class StudentLifeScreen extends StatelessWidget {
  const StudentLifeScreen({Key? key}) : super(key: key);

  Image _buildNetworkImage(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget? child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child!;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Image> _listOfAthleticImages = [
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/ath1.jpg'),
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/ath3.jpg'),
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/ath2.jpg'),
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/ath4.jpg'),
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/ath8.jpg'),
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/ath7.jpg'),
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/ath6.jpg'),
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/ath5.jpg'),
    ];

    final List<Image> _listOfHousingImages = [
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/boy3.jpg'),
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/boy2.jpg'),
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/boy4-1.jpg'),
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/boy5.jpg'),
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/boy1.jpg'),
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/boy6.jpg'),
    ];

    final List<Image> _listOfDiningImages = [
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/girl4.jpg'),
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/girl3.jpg'),
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/girl5.jpg'),
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/girl7.jpg'),
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/girl6.jpg'),
      _buildNetworkImage(
          'https://bgiet.ac.in/wp-content/uploads/2017/05/girl1.jpg'),
    ];
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: customAppBar(
        title: 'Student Life',
        context: context,
      ),
      body: ListView(
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
    );
  }
}
