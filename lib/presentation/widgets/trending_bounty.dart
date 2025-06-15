import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';

import '../../infrastructure/models/bounty_model.dart';
import '../../infrastructure/services/api/api_service.dart';
import 'bounty_card.dart';

class TrendingBountyCarousel extends StatefulWidget {
  const TrendingBountyCarousel({super.key});

  @override
  State<TrendingBountyCarousel> createState() => _TrendingBountyCarouselState();
}

class _TrendingBountyCarouselState extends State<TrendingBountyCarousel> {
  late Future<List<BountyModel>> _bountiesFuture;

  @override
  void initState() {
    super.initState();
    _bountiesFuture = ContestHuntApi().fetchBounties();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double carouselHeight = screenHeight * 0.25;

    return SizedBox(
      height: carouselHeight,
      child: FutureBuilder<List<BountyModel>>(
        future: _bountiesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text("Failed to load bounties"));
          }

          // Filter: amount > 0
          final trending =
              snapshot.data!
                  .where(
                    (bounty) => bounty.amount != null && bounty.amount! > 0,
                  )
                  .take(5) // Ensure max of 5 bounties
                  .toList();

          if (trending.isEmpty) {
            return const Center(child: Text("No trending bounties found"));
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
              final bounty = trending[itemIndex];

              return GestureDetector(
                onTap: () {
                  
                  context.push('/bountydetail', extra: bounty);
                },
                child: BountyCard(
                  bounty: bounty,
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
