import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ChooseDateOrTime extends StatelessWidget {
  String iconName;
  String eventName;
  String chooseDateOrTime;
  Function onChooseDateOrTime;
  ChooseDateOrTime(
      {required this.chooseDateOrTime,
      required this.iconName,
      required this.eventName,
      required this.onChooseDateOrTime});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        Image.asset(iconName),
        SizedBox(
          width: width * 0.02,
        ),
        Expanded(
          child: Text(
            eventName,
            style: AppStyles.medium16Black,
          ),
        ),
        TextButton(
            onPressed: () {
              onChooseDateOrTime;
            },
            child: Text(
              chooseDateOrTime,
              style: AppStyles.medium16Primary,
            ))
      ],
    );
  }
}
