import 'package:google_fonts/google_fonts.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle semi20Primary = GoogleFonts.inter(
      fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.primaryLight);
  static TextStyle bold20Primary = GoogleFonts.inter(
      fontWeight: FontWeight.bold, fontSize: 20, color: AppColors.primaryLight);
  static TextStyle semi20Black = GoogleFonts.inter(
      fontWeight: FontWeight.w700, fontSize: 20, color: AppColors.blackColor);
  static TextStyle bold12White = GoogleFonts.inter(
      fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.whiteColor);
  static TextStyle bold24White = GoogleFonts.inter(
      fontWeight: FontWeight.bold, fontSize: 24, color: AppColors.whiteColor);
  static TextStyle bold14Black = GoogleFonts.inter(
      fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.blackColor);
  static TextStyle bold14Primary = GoogleFonts.inter(
      fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.primaryLight);
  static TextStyle medium16White = GoogleFonts.inter(
      fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.whiteColor);
  static TextStyle regular14White =
      GoogleFonts.inter(fontSize: 14, color: AppColors.whiteColor);
  static TextStyle medium14White = GoogleFonts.inter(
      fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.whiteColor);
  static TextStyle medium16Primary = GoogleFonts.inter(
      fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.primaryLight);
  static TextStyle medium16Grey = GoogleFonts.inter(
      fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.greyColor);
}
