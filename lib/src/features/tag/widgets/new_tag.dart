import 'package:flutter/material.dart';

import '../../../core/widgets/field.dart';
import '../../../core/widgets/main_button.dart';

class NewTag extends StatefulWidget {
  const NewTag({super.key});

  @override
  State<NewTag> createState() => _NewTagState();
}

class _NewTagState extends State<NewTag> {
  final tagController = TextEditingController();

  @override
  void dispose() {
    tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Field(
          controller: tagController,
          hintText: 'New tag name',
          fieldType: FieldType.text,
          onChanged: (_) {
            setState(() {});
          },
        ),
        const SizedBox(height: 24),
        MainButton(
          title: 'Save',
          onPressed: tagController.text.isEmpty ? null : () {},
        ),
        const SizedBox(height: 46),
      ],
    );
  }
}
