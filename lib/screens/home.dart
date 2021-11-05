// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bgiet/widgets/custom_app_bar.dart';
import 'package:bgiet/widgets/main_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final YoutubePlayerController _youtubePlayerController =
      YoutubePlayerController(
    initialVideoId:
        'QitBHMpGn_Q', // URL: https://www.youtube.com/watch?v=QitBHMpGn_Q
    flags: YoutubePlayerFlags(
      controlsVisibleAtStart: true,
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'Home',
      ),
      drawer: MainDrawer(),
      body: ListView(
        children: [
          CarouselSlider(
            items: [
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
            ],
            options: CarouselOptions(
              autoPlayCurve: Curves.easeOutBack,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
              pauseAutoPlayInFiniteScroll: false,
            ),
          ),
          SizedBox(
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
          SizedBox(
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
