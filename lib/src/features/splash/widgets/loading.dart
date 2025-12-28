import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, required this.loaded});

  final bool loaded;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 240,
      decoration: BoxDecoration(
        color: const Color(0xffC6D9F3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 3),
            width: loaded ? 240 : 0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [
                  Color(0xff22428E),
                  Color(0xff6C6CFF),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  offset: const Offset(0, 1),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
