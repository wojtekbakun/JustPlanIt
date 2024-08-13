import 'colors.dart';
import 'package:flutter/material.dart';

class AppDecorations {
  static BoxShadow lightShadow = BoxShadow(
    color: AppColors.backgroundLight.withOpacity(0.05),
    offset: const Offset(0, 4),
    blurRadius: 8,
    spreadRadius: 2,
  );

  static BoxShadow darkShadow = BoxShadow(
    color: AppColors.backgroundDark.withOpacity(0.2),
    offset: const Offset(0, 4),
    blurRadius: 8,
    spreadRadius: 2,
  );

  static BoxDecoration lightContainerDecoration = BoxDecoration(
    color: AppColors.backgroundDark,
    borderRadius: BorderRadius.circular(24),
    border: Border.all(
      color: AppColors.backgroundDarkLow,
      width: 1,
    ),
    boxShadow: [
      lightShadow,
    ],
  );
}
