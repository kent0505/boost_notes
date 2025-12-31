import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/image_widget.dart';
import '../../../core/widgets/sheet_widget.dart';
import '../screens/call_recording_screen.dart';
import 'record_sheet.dart';
import 'youtube_sheet.dart';

class NewNoteSheet extends StatelessWidget {
  const NewNoteSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Tile(
          title: 'Record audio',
          asset: Assets.note1,
          color: const Color(0xff8383E8).withValues(alpha: 0.35),
          gradient: const [
            Color(0xffD3CFCF),
            Color(0xffD3CFCF),
            Color(0xff5961E2),
            Color(0xff0030B7),
            Color(0xff0030B7),
            Color(0xff0030B7),
            Color(0xff5961E2),
          ],
          onPressed: () {
            context.pop();
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const RecordSheet();
              },
            );
          },
        ),
        _Tile(
          title: 'YouTube video',
          asset: Assets.note2,
          color: const Color(0xff7DFF4D).withValues(alpha: 0.35),
          gradient: const [
            Color(0xffD3CFCF),
            Color(0xffD3CFCF),
            Color(0xff289400),
            Color(0xff289400),
            Color(0xff289400),
            Color(0xff289400),
            Color(0xff289400),
          ],
          onPressed: () {
            context.pop();
            SheetWidget.open(
              context,
              title: 'YouTube note',
              child: const YoutubeSheet(),
            );
          },
        ),
        _Tile(
          title: 'Upload voice memo',
          asset: Assets.note3,
          color: const Color(0xffE2C199),
          gradient: const [
            Color(0xffD3CFCF),
            Color(0xffD3CFCF),
            Color(0xffD3A063),
            Color(0xffC97209),
            Color(0xffC97209),
            Color(0xffC97209),
            Color(0xffD3A063),
          ],
          onPressed: () {},
        ),
        _Tile(
          title: 'Call recording',
          asset: Assets.note4,
          color: const Color(0xff4DDEFF).withValues(alpha: 0.35),
          gradient: const [
            Color(0xffD3CFCF),
            Color(0xffD3CFCF),
            Color(0xff006A82),
            Color(0xff00596D),
            Color(0xff00596D),
            Color(0xff00596D),
            Color(0xff006A82),
          ],
          onPressed: () {
            context.pop();
            context.push(CallRecordingScreen.routePath);
          },
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
    required this.color,
    required this.gradient,
    required this.onPressed,
  });

  final String title;
  final String asset;
  final Color color;
  final List<Color> gradient;
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
        onPressed: onPressed,
        child: Row(
          children: [
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
                border: GradientBoxBorder(
                  width: 1,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: gradient,
                  ),
                ),
              ),
              child: Center(
                child: ImageWidget(asset),
              ),
            ),
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
