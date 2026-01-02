import 'package:boost_notes/src/core/utils.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'button.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonTexts,
    required this.buttonColors,
    required this.onPresseds,
  });

  final String title;
  final String subtitle;
  final List<String> buttonTexts;
  final List<Color?> buttonColors;
  final List<VoidCallback?> onPresseds;

  static void show(
    BuildContext context, {
    required String title,
    required String subtitle,
    required List<String> buttonTexts,
    required List<Color?> buttonColors,
    required List<VoidCallback?> onPresseds,
    bool barrierDismissible = true,
  }) {
    if (buttonTexts.isEmpty ||
        buttonColors.isEmpty ||
        buttonTexts.length > 2 ||
        buttonTexts.length != buttonColors.length &&
            buttonTexts.length != onPresseds.length) {
      return logger('Length mismatch');
    }

    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      useSafeArea: false,
      builder: (context) {
        return PopScope(
          canPop: barrierDismissible,
          child: DialogWidget(
            title: title,
            subtitle: subtitle,
            buttonTexts: buttonTexts,
            buttonColors: buttonColors,
            onPresseds: onPresseds,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 270,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: AppFonts.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: AppFonts.w500,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 1,
              color: const Color(0xffAEAEAE),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Button(
                    onPressed: onPresseds.first,
                    child: Text(
                      buttonTexts.first,
                      style: TextStyle(
                        color: buttonColors.first,
                        fontSize: 16,
                        fontFamily: AppFonts.w600,
                      ),
                    ),
                  ),
                ),
                if (buttonTexts.length == 2) ...[
                  Container(
                    width: 1,
                    height: 44,
                    color: const Color(0xffAEAEAE),
                  ),
                  Expanded(
                    child: Button(
                      onPressed: onPresseds.last,
                      child: Text(
                        buttonTexts.last,
                        style: TextStyle(
                          color: buttonColors.last,
                          fontSize: 16,
                          fontFamily: AppFonts.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
