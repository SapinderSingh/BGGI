import 'package:bgiet/widgets/carsoul_slider.dart';
import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:bgiet/widgets/main_drawer.dart';
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
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'Home',
      ),
      drawer: const MainDrawer(),
      body: ListView(
        children: [
          customCarouselSlider(_listOfImages),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              'Why BGIET ?',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          _textBuilder(
            "• Recognized as one of the centers of excellence in higher education in Northern India for more than 15 years.",
            context,
          ),
          _textBuilder(
            "• The group has 10 institutes under its cap catering to 11,000 students in different streams.",
            context,
          ),
          _textBuilder(
            "• Proven record of placement for students in MNCs of higher repute.",
            context,
          ),
          _textBuilder(
            "• Faculty with hands-on industrial, teaching, and research experience.",
            context,
          ),
          _textBuilder(
            "• Personality development classes integrated in the curriculum throughout the program.",
            context,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Text(
              'Campus Tour',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: YoutubePlayer(
              progressColors: ProgressBarColors(
                playedColor: Colors.red,
                bufferedColor: Colors.grey,
                backgroundColor: Colors.grey[200],
                handleColor: Colors.red,
              ),
              controller: _youtubePlayerController,
              showVideoProgressIndicator: true,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Padding _textBuilder(String text, BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
        ),
        child: Text(
          text,
          style: Theme.of(context).primaryTextTheme.bodyText1,
        ),
      );
}
