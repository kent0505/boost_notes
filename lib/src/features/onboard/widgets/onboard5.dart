import 'package:boost_notes/src/core/widgets/image_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/blur.dart';
import '../../../core/widgets/svg_widget.dart';

class Onboard5 extends StatelessWidget {
  const Onboard5({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          top: 131,
          left: 0,
          right: 0,
          child: SvgWidget(Assets.onb19),
        ),
        Positioned(
          top: 276,
          left: 0,
          child: Blur(
            child: SvgWidget(Assets.onb21),
          ),
        ),
        Positioned(
          top: 217,
          right: 0,
          child: Blur(
            child: SvgWidget(Assets.onb22),
          ),
        ),
        Positioned(
          top: 270,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 136,
            child: Center(
              child: Stack(
                children: [
                  SvgWidget(Assets.onb20),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: ImageWidget(asset: Assets.onb24),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 391,
          right: 0,
          child: SvgWidget(Assets.onb23),
        ),
      ],
    );
  }
}
