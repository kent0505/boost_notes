import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/icon_btn.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const routePath = '/SettingsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 24 + MediaQuery.of(context).viewPadding.top,
          ),
          Row(
            children: [
              const SizedBox(width: 24),
              const Text(
                'Settings',
                style: TextStyle(
                  color: Color(0xff1A2969),
                  fontSize: 22,
                  fontFamily: AppFonts.w600,
                ),
              ),
              const Spacer(),
              IconBtn(
                asset: Assets.close,
                onPressed: () {
                  context.pop();
                },
              ),
              const SizedBox(width: 24),
            ],
          ),
        ],
      ),
    );
  }
}
