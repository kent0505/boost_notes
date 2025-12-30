import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/image_widget.dart';
import '../../../core/widgets/svg_widget.dart';

class Onboard4 extends StatelessWidget {
  const Onboard4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          top: 102,
          left: 0,
          right: 0,
          child: Opacity(
            opacity: 0.15,
            child: ImageWidget(
              Assets.onb16,
            ),
          ),
        ),
        Positioned(
          top: 67,
          left: 0,
          right: 0,
          child: ImageWidget(
            Assets.onb17,
            height: 300,
          ),
        ),
        Positioned(
          top: 340,
          left: 32,
          child: SvgWidget(Assets.onb18),
        ),
      ],
    );
  }
}
