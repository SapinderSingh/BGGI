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
    padding: EdgeInsets.symmetric(
      vertical: MediaQuery.of(context).size.width / 44.1,
    ),
    child: Text(text, style: Theme.of(context).primaryTextTheme.bodyText1));

Text bodyText1WithoutPadding(BuildContext context, String text) =>
    Text(text, style: Theme.of(context).primaryTextTheme.bodyText1);

Text bodyText2(BuildContext context, String text) =>
    Text(text, style: Theme.of(context).primaryTextTheme.bodyText2);

SizedBox dynamicHeightSizedBox(BuildContext context, {required int height}) {
  final double _width = MediaQuery.of(context).size.width;
  switch (height) {
    case 5:
      return SizedBox(height: _width / 82.22);
    case 10:
      return SizedBox(height: _width / 41.1);
    case 15:
      return SizedBox(height: _width / 27.4);
    case 20:
      return SizedBox(height: _width / 20.55);
    case 60:
      return SizedBox(height: _width / 6.85);
    default:
      return SizedBox(height: _width / 41.1);
  }
}

SizedBox dynamicWidthSizedBox(BuildContext context, {required int width}) {
  final double _width = MediaQuery.of(context).size.width;
  switch (width) {
    case 5:
      return SizedBox(width: _width / 82.22);
    case 10:
      return SizedBox(width: _width / 41.1);
    case 15:
      return SizedBox(width: _width / 27.4);
    case 20:
      return SizedBox(width: _width / 20.55);
    case 60:
      return SizedBox(width: _width / 6.85);
    default:
      return SizedBox(width: _width / 41.1);
  }
}

EdgeInsetsGeometry dynamicPadding(BuildContext context,
    {required int padding}) {
  final double _width = MediaQuery.of(context).size.width;
  switch (padding) {
    case 10:
      return EdgeInsets.all(_width / 41.1);
    case 16:
      return EdgeInsets.all(_width / 27.5);
    default:
      return EdgeInsets.all(_width / 41.1);
  }
}
