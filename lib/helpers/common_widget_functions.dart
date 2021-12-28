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
