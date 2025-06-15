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
  static Future<List<BountyModel>>? _cachedBountiesFuture;

  @override
  void initState() {
    super.initState();
    _cachedBountiesFuture ??= ContestHuntApi().fetchBounties(); // cache once
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double carouselHeight = screenHeight * 0.25;

    return SizedBox(
      height: carouselHeight,
      child: FutureBuilder<List<BountyModel>>(
        future: _cachedBountiesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text("Failed to load bounties"));
          }

          final trending = snapshot.data!
              .where((bounty) => bounty.amount != null && bounty.amount! > 0)
              .take(5)
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
            itemBuilder: (context, index, _) {
              final bounty = trending[index];
              return GestureDetector(
                onTap: () => context.push('/bountydetail', extra: bounty),
                child: BountyCard(
                  bounty: bounty,
                  index: index,
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
