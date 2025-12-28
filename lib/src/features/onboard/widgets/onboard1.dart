import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/svg_widget.dart';

class Onboard1 extends StatelessWidget {
  const Onboard1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          top: 76,
          left: 0,
          right: 0,
          child: SvgWidget(Assets.onb1),
        ),
        Positioned(
          top: 128,
          left: 0,
          right: 0,
          child: SvgWidget(Assets.onb2),
        ),
        Positioned(
          top: 388,
          left: 0,
          right: 0,
          child: SvgWidget(Assets.onb3),
        ),
        Positioned(
          top: 197,
          right: 64,
          child: SvgWidget(Assets.onb4),
        ),
        Positioned(
          top: 343,
          right: 23,
          child: SvgWidget(Assets.onb5),
        ),
        Positioned(
          top: 128,
          left: 18,
          child: SvgWidget(Assets.onb6),
        ),
        Positioned(
          top: 341,
          left: 23,
          child: SvgWidget(Assets.onb7),
        ),
        Positioned(
          top: 226,
          left: 0,
          child: SvgWidget(Assets.onb8),
        ),
      ],
    );
  }
}
