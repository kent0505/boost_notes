import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/sheet_widget.dart';
import '../../../core/widgets/svg_widget.dart';
import '../bloc/tag_bloc.dart';
import '../models/tag.dart';
import 'tag_sheet.dart';

class TagCard extends StatelessWidget {
  const TagCard({super.key, required this.tag});

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TagBloc>();
    final active = bloc.state.tag.id == tag.id;

    return GestureDetector(
      onLongPress: tag.id == 0
          ? null
          : () {
              showDialog(
                context: context,
                barrierColor: Colors.transparent,
                builder: (context) {
                  return _Dialog(
                    onEdit: () async {
                      await SheetWidget.open(
                        context,
                        title: 'Edit Tag',
                        child: TagSheet(tag: tag),
                      ).then(
                        (value) {
                          if (context.mounted) {
                            context.pop();
                          }
                        },
                      );
                    },
                    onDelete: () {
                      bloc.add(DeleteTag(tag: tag));
                      context.pop();
                    },
                  );
                },
              );
            },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: Constants.milliseconds),
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              active ? const Color(0xff6C6CFF) : Colors.white,
              active ? const Color(0xff3670FA) : Colors.white,
            ],
          ),
        ),
        child: Button(
          onPressed: active
              ? null
              : () {
                  bloc.add(SelectTag(tag: tag));
                },
          child: Text(
            tag.title,
            style: TextStyle(
              color: active ? Colors.white : const Color(0xff1A2969),
              fontSize: 12,
              fontFamily: AppFonts.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _Dialog extends StatelessWidget {
  const _Dialog({
    required this.onEdit,
    required this.onDelete,
  });

  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).viewPadding.top;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
      child: Stack(
        children: [
          Positioned(
            top: top + 230,
            right: 14,
            child: Column(
              children: [
                _DialogActionButton(
                  title: 'Edit tag',
                  asset: Assets.edit,
                  color: Colors.black,
                  top: const Radius.circular(14),
                  onPressed: onEdit,
                ),
                const SizedBox(height: 6),
                _DialogActionButton(
                  title: 'Delete Note',
                  asset: Assets.delete,
                  color: const Color(0xffFF0606),
                  bottom: const Radius.circular(14),
                  onPressed: onDelete,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DialogActionButton extends StatelessWidget {
  const _DialogActionButton({
    required this.title,
    required this.asset,
    required this.color,
    this.top = Radius.zero,
    this.bottom = Radius.zero,
    required this.onPressed,
  });

  final String title;
  final String asset;
  final Color color;
  final Radius top;
  final Radius bottom;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 270,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: top,
          bottom: bottom,
        ),
      ),
      child: Button(
        onPressed: onPressed,
        child: Row(
          children: [
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 16,
                  fontFamily: AppFonts.w500,
                ),
              ),
            ),
            SvgWidget(
              asset,
              color: color,
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
