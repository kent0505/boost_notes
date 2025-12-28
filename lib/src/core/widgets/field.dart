import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

enum FieldType {
  text,

  multiline,
  number,
}

class Field extends StatelessWidget {
  const Field({
    super.key,
    this.controller,
    required this.hintText,
    required this.fieldType,
    this.maxLength = 50,
    this.textCapitalization = TextCapitalization.sentences,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onTap,
  });

  final TextEditingController? controller;
  final String hintText;
  final FieldType fieldType;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final keyboardType = switch (fieldType) {
      FieldType.text => TextInputType.text,
      FieldType.multiline => TextInputType.multiline,
      FieldType.number => TextInputType.number,
    };

    final inputFormatters = <TextInputFormatter>[
      LengthLimitingTextInputFormatter(maxLength),
      if (fieldType == FieldType.number) FilteringTextInputFormatter.digitsOnly,
    ];

    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      minLines: fieldType == FieldType.multiline ? 1 : 1,
      maxLines: fieldType == FieldType.multiline ? 8 : 1,
      style: const TextStyle(
        color: Color(0xff1A2969),
        fontSize: 14,
        fontFamily: AppFonts.w500,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: onChanged,
      onTap: onTap,
    );
  }
}
