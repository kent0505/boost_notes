import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';
import 'icon_btn.dart';

class SheetWidget extends StatelessWidget {
  const SheetWidget({
    super.key,
    required this.title,
    required this.child,
    this.onCLose,
  });

  final String title;
  final Widget child;
  final VoidCallback? onCLose;

  static Future<void> open(
    BuildContext context, {
    required String title,
    required Widget child,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SheetWidget(
          title: title,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xff1A2969),
                  fontSize: 22,
                  fontFamily: AppFonts.w600,
                ),
              ),
              const Spacer(),
              IconBtn(
                asset: Assets.close,
                onPressed: onCLose ??
                    () {
                      context.pop();
                    },
              ),
            ],
          ),
          const SizedBox(height: 24),
          child,
        ],
      ),
    );
  }
}
