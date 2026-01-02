import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';
import '../bloc/vip_bloc.dart';
import '../screens/paywall_screen.dart';

class UpgradeButton extends StatelessWidget {
  const UpgradeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VipBloc, VipState>(
      builder: (context, state) {
        return Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              colors: [
                Color(0xffD7970B),
                Color(0xffFED403),
              ],
            ),
          ),
          child: Button(
            onPressed: () {
              PaywallScreen.show(context);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgWidget(Assets.vip2),
                SizedBox(width: 8),
                Text(
                  'Upgrade to Unlimited',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: AppFonts.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
