import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';
import '../utils.dart';
import 'button.dart';
import 'svg_widget.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({
    super.key,
    this.title = '',
    this.right,
    this.child,
  });

  final String title;
  final Widget? right;
  final Widget? child;

  static const height = 60.0;

  @override
  Size get preferredSize => const Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).viewPadding.top;

    return Container(
      height: height + top,
      padding: EdgeInsets.only(
        top: top,
        left: 16,
        right: 16,
      ),
      child: Row(
        children: [
          Button(
            onPressed: () {
              try {
                context.pop();
              } catch (e) {
                logger(e);
              }
            },
            child: const SvgWidget(Assets.close),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xff1A2969),
                fontSize: 16,
                fontFamily: AppFonts.w500,
                height: 1,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            height: height,
            width: 44,
            child: right,
          ),
        ],
      ),
    );
  }
}
