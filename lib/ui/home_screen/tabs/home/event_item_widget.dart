import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class EventItemWidget extends StatelessWidget {
  const EventItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * 0.31,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryLight, width: 2),
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage("assets/Images/birthday.png"),
            fit: BoxFit.fill,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.005),
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.01),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.whiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("23", style: AppStyles.bold20Primary),
                Text(
                  "Dec",
                  style: AppStyles.bold20Primary,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: height * 0.005, horizontal: width * 0.02),
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.whiteColor),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "This is a Birthday Party",
                    style: AppStyles.bold14Black,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const ImageIcon(AssetImage("assets/Images/favorite.png")))
              ],
            ),
          )
        ],
      ),
    );
  }
}
