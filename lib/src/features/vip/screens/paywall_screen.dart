import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/appbar.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  static const routePath = '/PaywallScreen';

  static void show(BuildContext context) {
    context.push(PaywallScreen.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Appbar(),
      body: Column(
        children: [],
      ),
    );
  }
}
