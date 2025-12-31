import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

import 'button.dart';
import 'svg_widget.dart';

class IconBtn extends StatelessWidget {
  const IconBtn({
    super.key,
    required this.asset,
    required this.onPressed,
  });

  final String asset;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPressed,
      minSize: 32,
      child: Container(
        height: 32,
        width: 32,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          border: GradientBoxBorder(
            width: 1,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffD3CFCF),
                Color(0xffD3CFCF),
                Color(0xff5961E2),
                Color(0xff0030B7),
                Color(0xff0030B7),
                Color(0xff0030B7),
                Color(0xff5961E2),
              ],
            ),
          ),
        ),
        child: Center(
          child: SvgWidget(asset),
        ),
      ),
    );
  }
}
