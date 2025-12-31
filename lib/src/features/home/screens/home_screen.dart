import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/field.dart';
import '../../../core/widgets/main_button.dart';
import '../../../core/widgets/sheet_widget.dart';
import '../../../core/widgets/svg_widget.dart';
import '../../note/widgets/new_note_sheet.dart';
import '../../tag/widgets/tags_list.dart';
import '../widgets/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routePath = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24 + MediaQuery.of(context).viewPadding.top,
              ),
              const HomeAppbar(),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Field(
                  controller: searchController,
                  hintText: 'Search',
                  fieldType: FieldType.text,
                  prefixIcon: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgWidget(Assets.search),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const TagsList(),
            ],
          ),
          Positioned(
            bottom: 46,
            left: 0,
            right: 0,
            child: Center(
              child: MainButton(
                title: 'New Note',
                asset: Assets.plus,
                width: Constants.mainButtonWidth,
                onPressed: () {
                  SheetWidget.open(
                    context,
                    title: 'New note',
                    child: const NewNoteSheet(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
