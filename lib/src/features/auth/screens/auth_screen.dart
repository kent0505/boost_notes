import 'package:flutter/material.dart';

import '../../../core/widgets/appbar.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static const routePath = '/AuthScreen';

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
