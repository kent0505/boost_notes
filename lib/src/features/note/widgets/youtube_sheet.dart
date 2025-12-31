import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/field.dart';
import '../../../core/widgets/image_widget.dart';
import '../../../core/widgets/main_button.dart';

class YoutubeSheet extends StatefulWidget {
  const YoutubeSheet({super.key});

  @override
  State<YoutubeSheet> createState() => _YoutubeSheetState();
}

class _YoutubeSheetState extends State<YoutubeSheet> {
  final controller = TextEditingController();

  bool error = false;

  void onChanged(String value) {
    setState(() {
      error = value.isNotEmpty && !isYoutubeUrl(value);
    });
  }

  void onSave() {
    // context.read<TagBloc>().add(widget.tag == null
    //     ? AddTag(tag: Tag(title: controller.text))
    //     : EditTag(tag: widget.tag!..title = controller.text));
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    // controller.text = widget.tag?.title ?? '';
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = error ? const Color(0xffE40E1A) : const Color(0xff626262);

    return Column(
      children: [
        Field(
          controller: controller,
          hintText: 'Place link here',
          fieldType: FieldType.text,
          onChanged: onChanged,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageWidget(
              Assets.warning,
              height: 10,
              color: color,
            ),
            const SizedBox(width: 2),
            Text(
              error
                  ? 'This link isn’t a YouTube link'
                  : 'Unlisted videos aren’t supported',
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontFamily: AppFonts.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        MainButton(
          title: 'Save',
          onPressed: controller.text.isEmpty || error ? null : onSave,
        ),
        const SizedBox(height: 46),
      ],
    );
  }
}
