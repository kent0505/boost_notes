import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/field.dart';
import '../../../core/widgets/icon_btn.dart';
import '../../../core/widgets/main_button.dart';
import '../../../core/widgets/sheet_widget.dart';
import '../../../core/widgets/svg_widget.dart';
import '../../note/widgets/new_note.dart';
import '../../tag/widgets/tag_sheet.dart';
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
      body: Stack(
        children: [
          Column(
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
              SizedBox(
                height: 38,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    Container(
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
                    ),
                    const SizedBox(width: 8),
                    IconBtn(
                      asset: Assets.add,
                      size: 34,
                      onPressed: () {
                        SheetWidget.open(
                          context,
                          title: 'Add tag',
                          child: const TagSheet(),
                        );
                      },
                    ),
                  ],
                ),
              ),
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
                    child: const NewNote(),
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
