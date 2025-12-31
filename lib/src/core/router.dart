import 'package:go_router/go_router.dart';

import '../features/home/screens/home_screen.dart';
import '../features/note/screens/call_recording_screen.dart';
import '../features/onboard/screens/onboard_screen.dart';
import '../features/settings/screens/settings_screen.dart';
import '../features/splash/screens/splash_screen.dart';
import '../features/vip/screens/paywall_screen.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: OnboardScreen.routePath,
      builder: (context, state) => const OnboardScreen(),
    ),
    GoRoute(
      path: HomeScreen.routePath,
      builder: (context, state) => const HomeScreen(),
    ),

    // notes
    GoRoute(
      path: CallRecordingScreen.routePath,
      builder: (context, state) => const CallRecordingScreen(),
    ),

    // settings
    GoRoute(
      path: SettingsScreen.routePath,
      builder: (context, state) => const SettingsScreen(),
    ),

    // vip
    GoRoute(
      path: PaywallScreen.routePath,
      builder: (context, state) => const PaywallScreen(),
    ),
  ],
);
