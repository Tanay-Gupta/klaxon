import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klaxon/presentation/pages/home.dart';
import 'package:klaxon/presentation/pages/homePage/home_screen.dart';
import 'package:klaxon/presentation/pages/contests/contest_page.dart';
import 'package:klaxon/presentation/pages/hackathons/hackathon_page.dart';
import 'package:klaxon/presentation/pages/bounty/bounty_page.dart';
import 'package:klaxon/presentation/pages/settings/settings_page.dart';
import 'package:klaxon/presentation/pages/errors/no_connection_screen.dart';
import 'package:klaxon/presentation/pages/errors/under_maintenance_screen.dart';
import 'package:klaxon/presentation/pages/notifications/empty_notifications_screen.dart';
import 'package:klaxon/presentation/pages/platform/platform_detail_page.dart';

import '../../infrastructure/models/contest_model.dart';
import '../../infrastructure/models/platform_model.dart';
import '../pages/eventDetail/event_detail_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
      routes: [
        GoRoute(
          path: 'explore',
          builder: (context, state) => HomePage(onNavigateToTab: (_) {}),
        ),
        GoRoute(
          path: 'contests',
          builder: (context, state) => const ContestPage(),
        ),
        GoRoute(
          path: 'hackathons',
          builder: (context, state) => const HackathonPage(),
        ),
        GoRoute(
          path: 'bounty',
          builder: (context, state) => const BountyPage(),
        ),
        GoRoute(
          path: 'settings',
          builder: (context, state) => const SettingsPage(),
        ),
      ],
    ),
    // GoRoute(
    //   path: '/notifications',
    //   builder: (context, state) => const EmptyNotificationsScreen(),
    // ),
    GoRoute(
      path: '/notifications',
      pageBuilder:
          (context, state) => buildCustomTransitionPage(
            key: state.pageKey,
            child: const EmptyNotificationsScreen(),
          ),
    ),
    // GoRoute(
    //   path: '/platform/:name',
    //   pageBuilder: (context, state) {
    //     final platformName = state.pathParameters['name'] ?? 'Error';
    //     return buildCustomTransitionPage(
    //       key: state.pageKey,
    //       child: PlatformDetailPage(platformName: platformName, platformType: PlatformType.contest), // Assuming PlatformType is an enum
    //     );
    //   },
    // ),
    GoRoute(
      path: '/platform',
      pageBuilder: (context, state) {
        final args = state.extra as Map<String, dynamic>?;

        final platformName = args?['platformName'] as String? ?? 'error';
        final platformType =
            args?['platformType'] as PlatformType? ?? PlatformType.contest;

        return buildCustomTransitionPage(
          key: state.pageKey,
          child: PlatformDetailPage(
            platformName: platformName,
            platformType: platformType,
          ),
        );
      },
    ),

    GoRoute(
      path: '/no_connection',
      builder: (context, state) => const NoConnectionScreen(),
    ),
    GoRoute(
      path: '/under_maintenance',
      builder: (context, state) => const UnderMaintenanceScreen(),
    ),
    // ContestDetailPage
    // GoRoute(
    //   path: '/contestdetail',
    //   builder: (context, state) => EventDetailPage(),
    // ),
    GoRoute(
      path: '/contestdetail',
      builder: (context, state) {
        final contest = state.extra as ContestModel;
        return EventDetailPage(contest: contest);
      },
    ),
  ],
  errorBuilder:
      (context, state) =>
          const Scaffold(body: Center(child: Text("404 - Page not found"))),
);

CustomTransitionPage<dynamic> buildCustomTransitionPage({
  required LocalKey key,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Slide from right animation
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween = Tween(
        begin: begin,
        end: end,
      ).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}
