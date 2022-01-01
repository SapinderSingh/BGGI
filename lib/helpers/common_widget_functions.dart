import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';

CarouselSlider customCarouselSlider({
  bool isNetworkImage = true,
  List<CachedNetworkImage>? listOfNetworkImages,
  List<Image>? listOfAssetImage,
}) =>
    CarouselSlider(
      items: isNetworkImage ? listOfNetworkImages : listOfAssetImage,
      options: CarouselOptions(
        autoPlayCurve: Curves.easeOutBack,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        pauseAutoPlayInFiniteScroll: false,
      ),
    );

DoubleBackToCloseApp pressBackAgainToClose({
  required Widget child,
}) =>
    DoubleBackToCloseApp(
      snackBar: const SnackBar(
        backgroundColor: Colors.black,
        content: Text(
          'Press back again to close',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      child: child,
    );

AppBar customAppBar(
  BuildContext context, {
  required String title,
}) =>
    AppBar(
      title: Text(
        title,
      ),
    );

Text h4Text(BuildContext context, String text) =>
    Text(text, style: Theme.of(context).primaryTextTheme.headline4);

Text h6Text(BuildContext context, String text) =>
    Text(text, style: Theme.of(context).primaryTextTheme.headline6);

Padding bodyText1(String text, BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(text, style: Theme.of(context).primaryTextTheme.bodyText1));

Text bodyText1WithoutPadding(BuildContext context, String text) =>
    Text(text, style: Theme.of(context).primaryTextTheme.bodyText1);

Text bodyText2(BuildContext context, String text) =>
    Text(text, style: Theme.of(context).primaryTextTheme.bodyText2);

SizedBox customHeightSizedBox(int height, BuildContext context) {
  final _screenHeight = MediaQuery.of(context).size.height;
  switch (height) {
    case 10:
      return SizedBox(height: 10);
    default:
      return SizedBox(height: _screenHeight * height / 100);
  }
}
