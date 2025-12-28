import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constants.dart';
import '../../home/screens/home_screen.dart';
import '../../onboard/data/onboard_repository.dart';
import '../../onboard/screens/onboard_screen.dart';
import '../widgets/loading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool loaded = false;

  void onLoaded(LottieComposition _) {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          loaded = true;
        });

        Future.delayed(
          const Duration(milliseconds: 3200),
          () {
            if (mounted) {
              if (context.read<OnboardRepository>().isOnboard()) {
                context.replace(OnboardScreen.routePath);
              } else {
                context.replace(HomeScreen.routePath);
              }
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: width,
              height: width * 1080 / 1920,
              child: Lottie.asset(
                Assets.wave,
                onLoaded: onLoaded,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Boost Notes AI',
              style: TextStyle(
                color: Color(0xff283A87),
                fontSize: 30,
                fontFamily: AppFonts.w600,
              ),
            ),
            const SizedBox(height: 100),
            Loading(loaded: loaded),
          ],
        ),
      ),
    );
  }
}
