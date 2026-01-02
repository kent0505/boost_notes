import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';
import '../../settings/screens/settings_screen.dart';
import '../../vip/screens/paywall_screen.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Row(
        children: [
          const SizedBox(width: 24),
          const Text(
            'My Notes',
            style: TextStyle(
              color: Color(0xff1A2969),
              fontSize: 28,
              fontFamily: AppFonts.w600,
            ),
          ),
          const Spacer(),
          Container(
            height: 28,
            width: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [
                  Color(0xffEEA607),
                  Color(0xffFED403),
                ],
              ),
            ),
            child: Button(
              onPressed: () {
                PaywallScreen.show(context);
              },
              child: const Row(
                children: [
                  SizedBox(width: 4),
                  SvgWidget(Assets.vip),
                  SizedBox(width: 2),
                  Text(
                    'PRO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: AppFonts.w600,
                    ),
                  ),
                  SizedBox(width: 6),
                ],
              ),
            ),
          ),
          Button(
            onPressed: () {
              context.push(SettingsScreen.routePath);
            },
            child: const SvgWidget(Assets.settings),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
