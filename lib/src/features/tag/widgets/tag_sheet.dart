import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/field.dart';
import '../../../core/widgets/main_button.dart';
import '../bloc/tag_bloc.dart';
import '../models/tag.dart';

class TagSheet extends StatefulWidget {
  const TagSheet({super.key, this.tag});

  final Tag? tag;

  @override
  State<TagSheet> createState() => _TagSheetState();
}

class _TagSheetState extends State<TagSheet> {
  final controller = TextEditingController();

  void onSave() {
    context.read<TagBloc>().add(widget.tag == null
        ? AddTag(tag: Tag(title: controller.text))
        : EditTag(tag: widget.tag!..title = controller.text));
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    controller.text = widget.tag?.title ?? '';
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Field(
          controller: controller,
          hintText: 'New tag name',
          fieldType: FieldType.text,
          onChanged: (_) {
            setState(() {});
          },
        ),
        const SizedBox(height: 24),
        MainButton(
          title: 'Save',
          onPressed: controller.text.isEmpty ? null : onSave,
        ),
        const SizedBox(height: 46),
      ],
    );
  }
}
