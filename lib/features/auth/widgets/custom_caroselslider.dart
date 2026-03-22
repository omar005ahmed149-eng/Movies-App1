import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/assets_manger.dart';

class CustomCarouselslider extends StatelessWidget {
  final List<String> images = [
    AssetsManger.avatarOne,
    AssetsManger.avatarTwo,
    AssetsManger.avatarThree,
    AssetsManger.avatarFour,
    AssetsManger.avatarFive,
    AssetsManger.avatarSix,
    AssetsManger.avatarSeven,
    AssetsManger.avatarEight,
    AssetsManger.avatarNine,
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 120.h,
        enlargeCenterPage: true,
        viewportFraction: 0.4,
        enableInfiniteScroll: true,
      ),
      items: images.map((imagePath) {
        return CircleAvatar(
          radius: 60.r,
          backgroundImage: AssetImage(imagePath),
        );
      }).toList(),
    );
  }
}
