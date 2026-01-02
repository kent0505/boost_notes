import 'package:flutter/material.dart';

import '../../../core/widgets/appbar.dart';

class TranslateScreen extends StatelessWidget {
  const TranslateScreen({super.key});

  static const routePath = '/TranslateScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(title: 'Translate Summary'),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [],
      ),
    );
  }
}
