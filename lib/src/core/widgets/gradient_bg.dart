import 'package:flutter/material.dart';

class GradientBg extends StatelessWidget {
  const GradientBg(this.child, {super.key});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffB2CCFF),
            Color(0xffF6F7F9),
            Color(0xffF6F7F9),
            Color(0xffB2CCFF),
          ],
        ),
      ),
      child: child,
    );
  }
}
