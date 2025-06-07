import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../values/constants.dart';

Widget trendingAlertCarouselSlider(context) {
  final height = MediaQuery.of(context).size.height;
  return Container(
    height: height * .25,
    color: kBackgroundColor,
    child: CarouselSlider.builder(
      options: CarouselOptions(
        height: (height * .25) - 20,
        aspectRatio: 16 / 9,
        viewportFraction: 0.9,
        initialPage: 0,
        enableInfiniteScroll: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: 4, // Replace with the actual number of items
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return GestureDetector(
          onTap: () {
            // Action on tap
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  offset: const Offset(3, 3),
                  blurRadius: 5,
                ),
              ],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: (height * .25) - 20,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/testImages/${0 + 1}.jpg',
                      ), // Replace with your image asset
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
