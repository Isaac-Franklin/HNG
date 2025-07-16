import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iabiacitizenapp/presentation/onboarding/App_intro_page.dart';
import 'package:iabiacitizenapp/presentation/onboarding/login.dart';
import 'package:iabiacitizenapp/presentation/onboarding/onboard_type.dart';
import 'package:iabiacitizenapp/presentation/onboarding/splashscreen.dart';
import 'package:iabiacitizenapp/presentation/shared/bottom_nav_scaffold.dart';
import 'package:iabiacitizenapp/presentation/userarea/bloc/usernavigation_bloc.dart';
import 'package:iabiacitizenapp/presentation/onboarding/bloc/onboarding_bloc.dart';
import 'package:iabiacitizenapp/presentation/userarea/communityarea.dart';
import 'package:iabiacitizenapp/presentation/userarea/iabiaai.dart';
import 'package:iabiacitizenapp/presentation/userarea/submitentry.dart';
import 'package:iabiacitizenapp/presentation/userarea/widgets/emercengycontacts.dart';
import 'package:iabiacitizenapp/router/combined_refresh_notifier.dart';

import '../presentation/userarea/home.dart';
// import '../presentation/userarea/profile.dart'; // Add profile page
// import '../presentation/userarea/cart.dart'; // Add cart page
// import '../presentation/shared/bottom_nav_scaffold.dart'; // Your shared scaffold with nav bar

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter(
  OnboardingBloc onboardingBloc,
  UsernavigationBloc usernavigationBloc,
) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    refreshListenable: CombinedRefreshNotifier([
      onboardingBloc.stream,
      usernavigationBloc.stream,
    ]),
    redirect: (context, state) {
      final onboardState = onboardingBloc.state;

      // Splash and onboarding logic
      if (onboardState is SplashNotSeen) return '/appintro';
      if (onboardState is Unauthenticated) return '/login';

      // Allow navigation within app only if authenticated
      if (onboardState is Authenticated) {
        if (state.fullPath == '/' ||
            state.fullPath == '/login' ||
            state.fullPath == '/appintro') {
          return '/home';
        }
      }

      return null;
    },
    routes: [
      /// Routes OUTSIDE bottom nav bar
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(path: '/appintro', builder: (context, state) => const AppIntro()),
      GoRoute(
        path: '/emergency',
        builder: (context, state) => const EmergencyContacts(),
      ),
      GoRoute(
        path: '/accesstype',
        builder: (context, state) => const OnboardTypeSelectionPage(),
      ),

      /// ShellRoute WITH persistent bottom nav bar
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return BottomNavScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder:
                (context, state) => NoTransitionPage(child: const HomePage()),
          ),
          GoRoute(
            path: '/emergency',
            pageBuilder:
                (context, state) =>
                    NoTransitionPage(child: const EmergencyContacts()),
          ),
          GoRoute(
            path: '/communityarea',
            pageBuilder:
                (context, state) =>
                    NoTransitionPage(child: const CommunityArea()),
          ),
          GoRoute(
            path: '/submitentry',
            pageBuilder:
                (context, state) =>
                    NoTransitionPage(child: const SubmitEntry()),
          ),
          GoRoute(
            path: '/ai',
            pageBuilder:
                (context, state) => NoTransitionPage(child: const AI()),
          ),
        ],
      ),
    ],
  );
}
