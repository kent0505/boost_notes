import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/image_widget.dart';
import '../../../core/widgets/main_button.dart';
import '../../home/screens/home_screen.dart';
import '../data/onboard_repository.dart';
import '../widgets/onboard1.dart';
import '../widgets/onboard2.dart';
import '../widgets/onboard3.dart';
import '../widgets/onboard4.dart';
import '../widgets/onboard5.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  static const routePath = '/OnboardScreen';

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int index = 0;

  final pageController = PageController();

  void onNext() {
    if (index == 4) {
      context.read<OnboardRepository>().removeOnboard();
      context.replace(HomeScreen.routePath);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: Constants.milliseconds),
        curve: Curves.easeInOut,
      );
      setState(() {
        index++;
      });
    }
  }

  void onPageChanged(int value) {
    setState(() {
      index = value;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const Positioned(
            top: 128,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.2,
              child: ImageWidget(asset: Assets.bg),
            ),
          ),
          const Opacity(
            opacity: 0.2,
            child: ImageWidget(asset: Assets.bg),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 300),
            child: PageView(
              controller: pageController,
              onPageChanged: onPageChanged,
              children: const [
                Onboard1(),
                Onboard2(),
                Onboard3(),
                Onboard4(),
                Onboard5(),
              ],
            ),
          ),
          Container(
            height: 300,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 5,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 6,
                      dotWidth: 15,
                      spacing: 8,
                      dotColor: Color(0xffBCC8F9),
                      activeDotColor: Color(0xff22428E),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  switch (index) {
                    0 => 'Record. Upload Transcribe instantly.',
                    1 => 'Perfect Notes. Ready to Share.',
                    2 => 'Customize. Export. Share.',
                    3 => 'Your notes are private.',
                    4 => 'Loved by millions worldwide.',
                    int() => '',
                  },
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff283A87),
                    fontSize: 28,
                    fontFamily: AppFonts.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  switch (index) {
                    0 =>
                      'Turn any audio or video intro clean, structured notes in seconds.',
                    1 =>
                      'Al transforms your recordings into clear, beautiful presentations.',
                    2 =>
                      'Translate, organize and share your notes in any format.',
                    3 =>
                      'We protect your data with advanced security. Only you have access.',
                    4 =>
                      'Join over 10M+ users who boost their productivity with AI.',
                    int() => '',
                  },
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff283A87),
                    fontSize: 16,
                    fontFamily: AppFonts.w500,
                  ),
                ),
                const Spacer(),
                MainButton(
                  title: 'Continue',
                  onPressed: onNext,
                ),
                const SizedBox(height: 34),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
