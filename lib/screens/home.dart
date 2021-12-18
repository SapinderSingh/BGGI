import 'package:bgiet/helpers/common_functions.dart';
import 'package:bgiet/widgets/carsoul_slider.dart';
import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:bgiet/widgets/press_back_again_to_close.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final YoutubePlayerController _youtubePlayerController =
      YoutubePlayerController(
    initialVideoId:
        'QitBHMpGn_Q', // URL: https://www.youtube.com/watch?v=QitBHMpGn_Q
    flags: const YoutubePlayerFlags(
      controlsVisibleAtStart: true,
      autoPlay: false,
      mute: false,
    ),
  );

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
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        progressColors: ProgressBarColors(
          playedColor: Colors.red,
          bufferedColor: Colors.grey,
          backgroundColor: Colors.grey[200],
          handleColor: Colors.red,
        ),
        controller: _youtubePlayerController,
        showVideoProgressIndicator: true,
      ),
      builder: (_, _videoPlayer) {
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
                      child: _videoPlayer,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
