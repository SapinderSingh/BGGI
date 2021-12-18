import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/models/our_recruiter_model.dart';
import 'package:bgiet/widgets/carsoul_slider.dart';
import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:bgiet/widgets/press_back_again_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    final CommonFunctions _commonFunction = CommonFunctions();
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'Home',
      ),
      drawer: const MainDrawer(),
      body: pressBackAgainToClose(
        child: ListView(
          children: [
            customCarouselSlider(
              listOfAssetImage: _listOfImages,
              isNetworkImage: false,
            ),
            const SizedBox(
              height: 20,
            ),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Text(
                  'Why BGIET ?',
                  style: Theme.of(context).primaryTextTheme.headline4,
                ),
                _commonFunction.descriptionText(
                  "• Recognized as one of the centers of excellence in higher education in Northern India for more than 15 years.",
                  context,
                ),
                _commonFunction.descriptionText(
                  "• The group has 10 institutes under its cap catering to 11,000 students in different streams.",
                  context,
                ),
                _commonFunction.descriptionText(
                  "• Proven record of placement for students in MNCs of higher repute.",
                  context,
                ),
                _commonFunction.descriptionText(
                  "• Faculty with hands-on industrial, teaching, and research experience.",
                  context,
                ),
                _commonFunction.descriptionText(
                  "• Personality development classes integrated in the curriculum throughout the program.",
                  context,
                ),
                Text(
                  'Campus Tour',
                  style: Theme.of(context).primaryTextTheme.headline4,
                ),
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
                Text(
                  'Our Recruiters',
                  style: Theme.of(context).primaryTextTheme.headline4,
                ),
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
                        height: 140,
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
                                Image.network(
                                  snapshot.data![index].imageUrl!,
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 200,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data![index].title!,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1,
                                  ),
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
