import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.borderColor,
      this.labelText,
      required this.hintText,
      this.hintStyle,
      this.labelStyle,
      this.prefixIcon,
      this.suffixIcon});
  String? hintText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  String? labelText;
  Color? borderColor;
  Widget? prefixIcon;
  Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: hintStyle ?? AppStyles.medium16Grey,
          labelStyle: labelStyle ?? AppStyles.medium16Grey,
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  BorderSide(color: borderColor ?? AppColors.greenColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  BorderSide(color: borderColor ?? AppColors.greenColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.redColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.redColor))),
    );
  }
}
