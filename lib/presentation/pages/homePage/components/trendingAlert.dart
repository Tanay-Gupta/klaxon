// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// import '../../../values/constants.dart';

// Widget trendingAlertCarouselSlider(context) {
//   final height = MediaQuery.of(context).size.height;
//   return Container(
//     height: height * .25,
//     color: Colors.transparent,
//     child: CarouselSlider.builder(
//       options: CarouselOptions(
//         height: (height * .25) - 20,
//         aspectRatio: 16 / 9,
//         viewportFraction: 0.9,
//         initialPage: 0,
//         enableInfiniteScroll: false,
//         autoPlay: true,
//         autoPlayInterval: const Duration(seconds: 5),
//         autoPlayAnimationDuration: const Duration(milliseconds: 800),
//         autoPlayCurve: Curves.fastOutSlowIn,
//         scrollDirection: Axis.horizontal,
//       ),
//       itemCount: 4, // Replace with the actual number of items
//       itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
//         return GestureDetector(
//           onTap: () {
//             // Action on tap
//           },
//           child: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 8.0),
//             decoration: BoxDecoration(
//               color: Colors.transparent,
//               // color: Colors.red, -- don't delete this comment, it's useful for debugging
//               borderRadius: BorderRadius.circular(20.0),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withAlpha(
//                     76,
//                   ), // ~30% opacity (255 * 0.3 ≈ 76)
//                   blurRadius: 8,
//                   offset: Offset(0, 4),
//                 ),
//               ],
//               border: Border.all(
//                 color: Colors.white.withAlpha(
//                   13,
//                 ), // ~5% opacity (255 * 0.05 ≈ 13)
//                 width: 1,
//               ),
//             ),

//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: (height * .25) - 30,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     image: DecorationImage(
//                       image: AssetImage(
//                         'assets/testImages/${0 + 1}.jpg',
//                       ), // Replace with your image asset
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../values/constants.dart';

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
      itemCount: 5, // You can make this dynamic
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
                'assets/testImages/${itemIndex + 1}.jpg', // Use dynamic index
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
