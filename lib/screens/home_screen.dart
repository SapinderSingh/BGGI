import 'dart:io';

import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/helpers/common_widget_functions.dart';
import 'package:bgiet/models/our_recruiter_model.dart';
import 'package:bgiet/widgets/custom_error_dialog.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Image> _listOfImages = [
    Image.asset(
      'assets/images/1.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/2.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/lib1.jpg',
      fit: BoxFit.cover,
    ),
  ];

  _checkInternet(BuildContext context) async {
    try {
      await InternetAddress.lookup('example.com');
    } on SocketException catch (_) {
      showDialog(
        context: context,
        builder: (_) => const CustomErrorDialog(
          contentText:
              'Please turn on your internet connection, otherwise the app will not work properly.',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final CommonFunctions _commonFunction = CommonFunctions();
    _checkInternet(context);
    return Scaffold(
      appBar: customAppBar(context, title: 'Home'),
      drawer: const MainDrawer(),
      body: pressBackAgainToClose(
        child: ListView(
          children: [
            customCarouselSlider(
              listOfAssetImage: _listOfImages,
              isNetworkImage: false,
            ),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                h4Text(context, 'Why BGGI ?'),
                bodyText1(
                  "• Recognized as one of the centers of excellence in higher education in Northern India for more than 15 years.",
                  context,
                ),
                bodyText1(
                  "• The group has 10 institutes under its cap catering to 11,000 students in different streams.",
                  context,
                ),
                bodyText1(
                  "• Proven record of placement for students in MNCs of higher repute.",
                  context,
                ),
                bodyText1(
                  "• Faculty with hands-on industrial, teaching, and research experience.",
                  context,
                ),
                bodyText1(
                  "• Personality development classes integrated in the curriculum throughout the program.",
                  context,
                ),
                h4Text(context, 'Campus Tour'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 220,
                    child: FlutterYoutubeView(
                      onViewCreated: (FlutterYoutubeViewController c) {
                        c.initialization();
                      },
                      scaleMode: YoutubeScaleMode.fitWidth,
                      params: const YoutubeParam(
                        videoId: 'QitBHMpGn_Q',
                        showUI: true,
                        startSeconds: 0.0,
                        autoPlay: false,
                        showFullScreen: false,
                        showYoutube: false,
                      ),
                    ),
                  ),
                ),
                h4Text(context, 'Our Recruiters'),
                const SizedBox(height: 10),
                FutureBuilder<List<OurRecruiterModel>>(
                  future: OurRecruiterModel.fetchAndAddRecruitersToList(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return SizedBox(
                        height: 145,
                        width: 200,
                        child: ListView.separated(
                          separatorBuilder: (_, __) =>
                              const VerticalDivider(endIndent: 30),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _commonFunction.loadImageFromNetwork(
                                  snapshot.data![index].imageUrl!,
                                  height: 100,
                                  width: 200,
                                ),
                                bodyText1(
                                  snapshot.data![index].title!,
                                  context,
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
