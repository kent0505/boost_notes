import 'package:flutter/material.dart';

import '../constants.dart';
import 'button.dart';
import 'svg_widget.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    this.asset = '',
    this.width,
    this.color,
    this.onPressed,
  });

  final String title;
  final String asset;
  final double? width;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final active = onPressed != null;

    return AnimatedContainer(
      duration: const Duration(milliseconds: Constants.milliseconds),
      height: 60,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: active
              ? [
                  const Color(0xff22428E),
                  const Color(0xff6C6CFF),
                  const Color(0xff22428E),
                ]
              : [
                  const Color(0xff727fcd),
                  const Color(0xff8d8ef5),
                  const Color(0xff727fcd),
                ],
        ),
      ),
      child: Button(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (asset.isNotEmpty) ...[
              SvgWidget(asset),
              const SizedBox(width: 10),
            ],
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: AppFonts.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
