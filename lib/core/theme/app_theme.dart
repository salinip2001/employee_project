import 'package:flutter/material.dart';
class AppColors {
  static const ink = Color(0xFF24303A); // header / primary text
  static const paper = Color(0xFFF1EDE3); // screen background
  static const card = Color(0xFFFBF9F4); // row surface
  static const veteran = Color(0xFF2F6B4F); // flagged: active + 5yrs+
  static const veteranSoft = Color(0xFFE4EEE7); // flagged row tint
  static const slate = Color(0xFF9B9488); // inactive / muted
  static const gold = Color(0xFFB8862B); // accent, used sparingly
  static const hairline = Color(0xFFDAD3C3); // dividers/borders
}

class AppTheme {
  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: AppColors.ink,
      scaffoldBackgroundColor: AppColors.paper,
      fontFamily: 'sans-serif',
    );

    return base.copyWith(
      textTheme: base.textTheme.copyWith(
        titleMedium: const TextStyle(
          fontFamily: 'serif',
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: AppColors.ink,
        ),
        bodyMedium: const TextStyle(
          fontSize: 13.5,
          color: AppColors.ink,
          height: 1.35,
        ),
        labelSmall: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 12,
          letterSpacing: 0.2,
          color: AppColors.ink,
        ),
      ),
    );
  }
}
