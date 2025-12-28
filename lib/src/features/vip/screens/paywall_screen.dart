import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  static const routePath = '/PaywallScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Column(
            children: [],
          ),
          Positioned(
            top: 16 + MediaQuery.of(context).viewPadding.top,
            left: 16,
            child: Button(
              onPressed: () {
                context.pop();
              },
              child: const SvgWidget(Assets.close),
            ),
          ),
        ],
      ),
    );
  }
}
