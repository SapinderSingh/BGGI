import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

CarouselSlider customCarouselSlider(List<Image> listOfImages) => CarouselSlider(
      items: listOfImages,
      options: CarouselOptions(
        autoPlayCurve: Curves.easeOutBack,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        pauseAutoPlayInFiniteScroll: false,
      ),
    );
