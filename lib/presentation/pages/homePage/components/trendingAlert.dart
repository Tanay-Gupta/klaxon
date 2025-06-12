
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


Widget trendingAlertCarouselSlider(BuildContext context) {
  final double screenHeight = MediaQuery.of(context).size.height;
  final double carouselHeight = screenHeight * 0.25;

  return SizedBox(
    height: carouselHeight,
    child: CarouselSlider.builder(
      options: CarouselOptions(
        height: carouselHeight - 20,
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
      itemCount: 9, // You can make this dynamic
      itemBuilder: (BuildContext context, int itemIndex, int _) {
        return GestureDetector(
          onTap: () {
            // Handle card tap
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Colors.white.withAlpha(13), // ~5% opacity

                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(64), // 255 * 0.25 ≈ 64

                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/testImages/${itemIndex + 1}.png', // Use dynamic index
                fit: BoxFit.cover,
                width: double.infinity,
                height: carouselHeight - 20,
              ),
            ),
          ),
        );
      },
    ),
  );
}
