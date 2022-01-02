import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/helpers/common_widget_functions.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoGalleryScreen extends StatelessWidget {
  const PhotoGalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommonFunctions _commonFunction = CommonFunctions();
    final List<CachedNetworkImage> _listOfAthleticImages = [
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

    final List<CachedNetworkImage> _listOfHousingImages = [
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

    final List<CachedNetworkImage> _listOfDiningImages = [
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
      appBar: customAppBar(context, title: 'Photo Gallery'),
      body: FutureBuilder<void>(
        future: Future.delayed(const Duration(seconds: 1)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: bodyText2(context, snapshot.error.toString()),
            );
          } else {
            return ListView(
              padding: dynamicPadding(context, padding: 10),
              children: [
                h6Text(context, 'Athletics & Recreation'),
                dynamicHeightSizedBox(context, height: 10),
                customCarouselSlider(
                  listOfNetworkImages: _listOfAthleticImages,
                ),
                dynamicHeightSizedBox(context, height: 20),
                h6Text(context, 'Housing & Dining'),
                dynamicHeightSizedBox(context, height: 10),
                customCarouselSlider(
                  listOfNetworkImages: _listOfHousingImages,
                ),
                dynamicHeightSizedBox(context, height: 20),
                customCarouselSlider(
                  listOfNetworkImages: _listOfDiningImages,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
