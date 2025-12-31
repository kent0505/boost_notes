import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/icon_btn.dart';
import '../../../core/widgets/sheet_widget.dart';
import '../bloc/tag_bloc.dart';
import '../models/tag.dart';
import 'tag_card.dart';
import 'tag_sheet.dart';

class TagsList extends StatelessWidget {
  const TagsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: BlocBuilder<TagBloc, TagState>(
        builder: (context, state) {
          return Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              TagCard(tag: allNotes),
              ...state.tags.map((tag) => TagCard(tag: tag)),
              IconBtn(
                asset: Assets.add,
                onPressed: () {
                  SheetWidget.open(
                    context,
                    title: 'Add tag',
                    child: const TagSheet(),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
