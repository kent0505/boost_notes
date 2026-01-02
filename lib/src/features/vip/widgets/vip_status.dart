import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../../../core/constants.dart';

class VipStatus extends StatelessWidget {
  const VipStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 74,
      decoration: BoxDecoration(
        color: const Color(0xff8383E8).withValues(alpha: 0.13),
        borderRadius: BorderRadius.circular(10),
        border: const GradientBoxBorder(
          width: 1,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
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
      child: const Center(
        child: Text(
          'Free Plan',
          style: TextStyle(
            color: Color(0xff1A2969),
            fontSize: 12,
            fontFamily: AppFonts.w600,
          ),
        ),
      ),
    );
  }
}
