import 'package:flutter/material.dart';

import 'constants.dart';

final theme = ThemeData(
  useMaterial3: false,
  brightness: Brightness.light,
  fontFamily: AppFonts.w500,
  colorScheme: const ColorScheme.light(
    primary: Colors.black,
    secondary: Color(0xffB2CCFF), // overscroll
    surface: Colors.transparent, // bg color when push
  ),

  // SCAFFOLD
  scaffoldBackgroundColor: Colors.transparent,

  // DIALOG
  dialogTheme: const DialogThemeData(
    insetPadding: EdgeInsets.zero,
    elevation: 0,
    backgroundColor: Color(0xffEDEDED),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),

  // BOTTOM SHEET
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color(0xffEDEDED),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.vertical(
        top: Radius.circular(20),
      ),
    ),
  ),

  // TEXTFIELD
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: const Color(0xff1A2969),
    selectionColor: const Color(0xff1A2969).withValues(alpha: 0.5),
    selectionHandleColor: const Color(0xff1A2969),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 16,
    ),
    hintStyle: const TextStyle(
      color: Color(0xffA6A6A6),
      fontSize: 14,
      fontFamily: AppFonts.w500,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
  ),
);
