import 'package:flutter/material.dart';

import '../../../core/widgets/appbar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  static const routePath = '/ChatScreen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(title: 'Chat with Boost Notes AI'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [],
      ),
    );
  }
}
