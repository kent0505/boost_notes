import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/image_widget.dart';

class CallRecordingScreen extends StatefulWidget {
  const CallRecordingScreen({super.key});

  static const routePath = '/CallRecordingScreen';

  @override
  State<CallRecordingScreen> createState() => _CallRecordingScreenState();
}

class _CallRecordingScreenState extends State<CallRecordingScreen> {
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(height: 36),
                    ImageWidget(Assets.call1),
                    SizedBox(height: 36),
                    Text(
                      'Call recording',
                      style: TextStyle(
                        color: Color(0xff1A2969),
                        fontSize: 28,
                        fontFamily: AppFonts.w600,
                      ),
                    ),
                    SizedBox(height: 32),
                    _Text(
                      'Start by recordong the call using the Phone app. After the call ends, open the Notes app and look for the saved record of the conversation.',
                    ),
                    SizedBox(height: 124),
                  ],
                ),
              ),
              _Phone(
                asset: Assets.call2,
                text:
                    'Start by recordong the call using the Phone app. After the call ends, open the Notes app and look for the saved record of the conversation.',
              ),
              _Phone(
                asset: Assets.call3,
                text:
                    'The call be recorded automatically, with both participants notified by an automated message',
              ),
              _Phone(
                asset: Assets.call4,
                text:
                    'You can access the call recording in the Apple Notes app once the call is finished',
              ),
              _Phone(
                asset: Assets.call5,
                text:
                    'Tap the Share button and select Boost Notes AI from the available options',
              ),
              _Phone(
                asset: Assets.call6,
                text:
                    'The app will launch automatically, and you’ll receive a summary of the conversation',
              ),
            ],
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: 6,
                effect: const ExpandingDotsEffect(
                  dotHeight: 6,
                  dotWidth: 15,
                  spacing: 8,
                  dotColor: Color(0xffBCC8F9),
                  activeDotColor: Color(0xff22428E),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color(0xff1A2969),
        fontSize: 14,
        fontFamily: AppFonts.w500,
      ),
    );
  }
}

class _Phone extends StatelessWidget {
  const _Phone({
    required this.asset,
    required this.text,
  });

  final String asset;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ImageWidget(
            asset,
            width: 225,
          ),
          _Text(text),
          const SizedBox(height: 124),
        ],
      ),
    );
  }
}
