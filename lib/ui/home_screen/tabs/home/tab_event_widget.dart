import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TabEventWidget extends StatelessWidget {
  String eventName;
  bool isSelected;
  Color backgroundColor;
  TextStyle textSelectedStyle;
  TextStyle textUnselectedStyle;
  Color? borderColor;
  TabEventWidget(
      {super.key,
      required this.eventName,
      required this.isSelected,
      required this.backgroundColor,
      required this.textSelectedStyle,
      required this.textUnselectedStyle,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.005),
      decoration: BoxDecoration(
          color: isSelected ? backgroundColor : AppColors.transparentColor,
          borderRadius: BorderRadius.circular(20),
          border:
              Border.all(color: borderColor ?? AppColors.whiteColor, width: 2)),
      child: Text(eventName,
          style: isSelected ? textSelectedStyle : textUnselectedStyle),
    );
  }
}
