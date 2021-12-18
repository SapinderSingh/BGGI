import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
