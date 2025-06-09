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
      // Instead of builder, use pageBuilder for custom transition
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const EmptyNotificationsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Slide from right animation
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            final tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          // transitionsBuilder: (context, animation, secondaryAnimation, child) {
          //   return FadeTransition(opacity: animation, child: child);
          // },
          // transitionsBuilder: (context, animation, secondaryAnimation, child) {
          //   return ScaleTransition(scale: animation, child: child);
          // },
          // transitionsBuilder: (context, animation, secondaryAnimation, child) {
          //   return RotationTransition(
          //     turns: animation,
          //     child: FadeTransition(opacity: animation, child: child),
          //   );
          // },
        );
      },
    ),
    GoRoute(
      path: '/platform/:name',
      builder: (context, state) {
        final platformName = state.pathParameters['name'] ?? 'Codeforces';
        return PlatformDetailPage(platformName: platformName);
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
  ],
  errorBuilder:
      (context, state) =>
          const Scaffold(body: Center(child: Text("404 - Page not found"))),
);
