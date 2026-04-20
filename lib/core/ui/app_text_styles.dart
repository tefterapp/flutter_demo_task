import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTextStyles {
  AppTextStyles._();

  static TextTheme build(TextTheme base) {
    final withFont = GoogleFonts.outfitTextTheme(base);
    return withFont.copyWith(
      headlineMedium: withFont.headlineMedium?.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 36,
      ),
      titleLarge: withFont.titleLarge?.copyWith(fontWeight: FontWeight.w700),
      titleMedium: withFont.titleMedium?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}
