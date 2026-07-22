import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static final heading1 = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static final heading2 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static final body = GoogleFonts.poppins(
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static final caption = GoogleFonts.poppins(
    fontSize: 13,
    color: AppColors.textSecondary,
  );
}