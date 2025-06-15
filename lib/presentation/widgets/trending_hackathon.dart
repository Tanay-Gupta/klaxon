import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:klaxon/infrastructure/models/hackathon_model.dart';
import 'package:klaxon/presentation/widgets/hackathon_card.dart';

import '../../infrastructure/services/api/api_service.dart';

class TrendingHackathonCarousel extends StatefulWidget {
  const TrendingHackathonCarousel({super.key});

  @override
  State<TrendingHackathonCarousel> createState() =>
      _TrendingBountyCarouselState();
}

class _TrendingBountyCarouselState extends State<TrendingHackathonCarousel> {
  late Future<List<HackathonModel>> _bountiesFuture;

  @override
  void initState() {
    super.initState();
    _bountiesFuture = ContestHuntApi().fetchHackathons();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double carouselHeight = screenHeight * 0.25;

    return SizedBox(
      height: carouselHeight,
      child: FutureBuilder<List<HackathonModel>>(
        future: _bountiesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text("Failed to load hackathon"));
          }

          // Filter: amount > 0
          final trending =
              snapshot.data!
                  .take(5) // Ensure max of 5 bounties
                  .toList();

          if (trending.isEmpty) {
            return const Center(child: Text("No trending hackathon found"));
          }

          return CarouselSlider.builder(
            options: CarouselOptions(
              height: carouselHeight,
              aspectRatio: 16 / 9,
              viewportFraction: 0.9,
              initialPage: 0,
              enableInfiniteScroll: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 1200),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
            itemCount: trending.length,
            itemBuilder: (BuildContext context, int itemIndex, int _) {
              final hackathon = trending[itemIndex];

              return GestureDetector(
                onTap: () {
                  context.push('/hackathondetail', extra: hackathon);
                },
                child: HackathonCard(
                  bounty: hackathon,
                  index: itemIndex,
                  height: carouselHeight,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
