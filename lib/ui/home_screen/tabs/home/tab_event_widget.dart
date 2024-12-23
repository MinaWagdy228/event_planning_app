import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TabEventWidget extends StatelessWidget {
  String eventName;
  bool isSelected;
  TabEventWidget(
      {super.key, required this.eventName, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.005),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.whiteColor : AppColors.transparentColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.whiteColor, width: 2)),
      child: Text(eventName,
          style:
              isSelected ? AppStyles.medium16Primary : AppStyles.medium16White),
    );
  }
}
