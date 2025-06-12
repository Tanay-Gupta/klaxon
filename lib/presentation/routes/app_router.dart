import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klaxon/infrastructure/models/bounty_model.dart';
import 'package:klaxon/infrastructure/models/hackathon_model.dart';
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
import '../pages/bountyDetail/bounty_detail_page.dart';
import '../pages/bountyDetail/components/body.dart';
import '../pages/contestDetail/contest_detail_page.dart';
import '../pages/hackathonDetail/hackathon_detail_page.dart';
import '../pages/notifications/scheduled_notifications_page.dart';

// final GoRouter router = GoRouter(
//   initialLocation: '/',
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const Home(),
//       routes: [
//         GoRoute(
//           path: 'explore',
//           builder: (context, state) => HomePage(onNavigateToTab: (_) {}),
//         ),
//         GoRoute(
//           path: 'contests',
//           builder: (context, state) => const ContestPage(),
//         ),
//         GoRoute(
//           path: 'hackathons',
//           builder: (context, state) => const HackathonPage(),
//         ),
//         GoRoute(
//           path: 'bounty',
//           builder: (context, state) => const BountyPage(),
//         ),
//         GoRoute(
//           path: 'settings',
//           builder: (context, state) => const SettingsPage(),
//         ),
//       ],
//     ),
//     GoRoute(
//       path: '/notifications',
//       pageBuilder:
//           (context, state) => buildCustomTransitionPage(
//             key: state.pageKey,
//             child: const EmptyNotificationsScreen(),
//           ),
//     ),
//     GoRoute(
//       path: '/platform',
//       pageBuilder: (context, state) {
//         final args = state.extra as Map<String, dynamic>?;

//         final platformName = args?['platformName'] as String? ?? 'error';
//         final platformType =
//             args?['platformType'] as PlatformType? ?? PlatformType.contest;

//         return buildCustomTransitionPage(
//           key: state.pageKey,
//           child: PlatformDetailPage(
//             platformName: platformName,
//             platformType: platformType,
//           ),
//         );
//       },
//     ),

//     GoRoute(
//       path: '/no_connection',
//       builder: (context, state) => const NoConnectionScreen(),
//     ),
//     GoRoute(
//       path: '/under_maintenance',
//       builder: (context, state) => const UnderMaintenanceScreen(),
//     ),
//     GoRoute(
//       path: '/contestdetail',
//       builder: (context, state) {
//         final contest = state.extra as ContestModel;
//         return ContestDetailPage(contest: contest);
//       },
//     ),
//     GoRoute(
//       path: '/hackathondetail',
//       builder: (context, state) {
//         final contest = state.extra as HackathonModel;
//         return HackathonDetailPage(contest: contest);
//       },
//     ),
//     GoRoute(
//       path: '/bountydetail',
//       builder: (context, state) {
//         final contest = state.extra as BountyModel;
//         return BountyDetailBody(contest: contest);
//       },
//     ),
//   ],
//   errorBuilder:
//       (context, state) =>
//           const Scaffold(body: Center(child: Text("404 - Page not found"))),
// );

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
final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => buildCustomTransitionPage(
        key: state.pageKey,
        child: const Home(),
      ),
      routes: [
        GoRoute(
          path: 'explore',
          pageBuilder: (context, state) => buildCustomTransitionPage(
            key: state.pageKey,
            child: HomePage(onNavigateToTab: (_) {}),
          ),
        ),
        GoRoute(
          path: 'contests',
          pageBuilder: (context, state) => buildCustomTransitionPage(
            key: state.pageKey,
            child: const ContestPage(),
          ),
        ),
        GoRoute(
          path: 'hackathons',
          pageBuilder: (context, state) => buildCustomTransitionPage(
            key: state.pageKey,
            child: const HackathonPage(),
          ),
        ),
        GoRoute(
          path: 'bounty',
          pageBuilder: (context, state) => buildCustomTransitionPage(
            key: state.pageKey,
            child: const BountyPage(),
          ),
        ),
        GoRoute(
          path: 'settings',
          pageBuilder: (context, state) => buildCustomTransitionPage(
            key: state.pageKey,
            child: const SettingsPage(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/notifications',
      pageBuilder: (context, state) => buildCustomTransitionPage(
        key: state.pageKey,
        child: const EmptyNotificationsScreen(),
      ),
    ),
    GoRoute(
      path: '/scheduledNotifications',
      pageBuilder: (context, state) => buildCustomTransitionPage(
        key: state.pageKey,
        child: const ScheduledNotificationsPage(),
      ),
    ),
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
      pageBuilder: (context, state) => buildCustomTransitionPage(
        key: state.pageKey,
        child: const NoConnectionScreen(),
      ),
    ),
    GoRoute(
      path: '/under_maintenance',
      pageBuilder: (context, state) => buildCustomTransitionPage(
        key: state.pageKey,
        child: const UnderMaintenanceScreen(),
      ),
    ),
    GoRoute(
      path: '/contestdetail',
      pageBuilder: (context, state) {
        final contest = state.extra as ContestModel;
        return buildCustomTransitionPage(
          key: state.pageKey,
          child: ContestDetailPage(contest: contest),
        );
      },
    ),
    GoRoute(
      path: '/hackathondetail',
      pageBuilder: (context, state) {
        final contest = state.extra as HackathonModel;
        return buildCustomTransitionPage(
          key: state.pageKey,
          child: HackathonDetailPage(contest: contest),
        );
      },
    ),
    GoRoute(
      path: '/bountydetail',
      pageBuilder: (context, state) {
        final contest = state.extra as BountyModel;
        return buildCustomTransitionPage(
          key: state.pageKey,
          child: BountyDetailPage(contest: contest),
        );
      },
    ),
  ],
  errorBuilder: (context, state) =>
      const Scaffold(body: Center(child: Text("404 - Page not found"))),
);
