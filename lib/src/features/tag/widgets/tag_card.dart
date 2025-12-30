import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../models/tag.dart';

class TagCard extends StatelessWidget {
  const TagCard({super.key, required this.tag});

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            Color(0xff6C6CFF),
            Color(0xff3670FA),
          ],
        ),
      ),
      child: Button(
        onPressed: () {},
        child: const Center(
          child: Text(
            'All Notes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: AppFonts.w500,
            ),
          ),
        ),
      ),
    );
  }
}
