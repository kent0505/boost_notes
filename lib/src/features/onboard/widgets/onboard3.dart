import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/image_widget.dart';
import '../../../core/widgets/svg_widget.dart';

class Onboard3 extends StatelessWidget {
  const Onboard3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          top: 192,
          right: 0,
          child: SvgWidget(Assets.onb13),
        ),
        Positioned(
          top: 106,
          left: 0,
          child: SvgWidget(Assets.onb12),
        ),
        Positioned(
          top: 273,
          left: 13,
          child: SvgWidget(Assets.onb14),
        ),
        Positioned(
          top: 362,
          left: 0,
          child: ImageWidget(
            Assets.onb15,
            height: 82,
          ),
        ),
      ],
    );
  }
}
