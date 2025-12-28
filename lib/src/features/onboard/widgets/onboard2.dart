import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/svg_widget.dart';

class Onboard2 extends StatelessWidget {
  const Onboard2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          top: 144,
          left: 0,
          child: SvgWidget(Assets.onb9),
        ),
        Positioned(
          top: 225,
          left: 63,
          child: SvgWidget(Assets.onb10),
        ),
        Positioned(
          top: 318,
          left: 178,
          child: SvgWidget(Assets.onb11),
        ),
      ],
    );
  }
}
