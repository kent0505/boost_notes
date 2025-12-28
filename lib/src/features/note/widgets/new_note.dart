import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';

class NewNote extends StatelessWidget {
  const NewNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Tile(
          title: 'Record audio',
          asset: '',
          onPressed: () {},
        ),
        _Tile(
          title: 'YouTube video',
          asset: '',
          onPressed: () {},
        ),
        _Tile(
          title: 'Upload voice memo',
          asset: '',
          onPressed: () {},
        ),
        _Tile(
          title: 'Call recording',
          asset: '',
          onPressed: () {},
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.title,
    required this.asset,
    required this.onPressed,
  });

  final String title;
  final String asset;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Button(
        onPressed: () {},
        child: Row(
          children: [
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xff1A2969),
                fontSize: 16,
                fontFamily: AppFonts.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
