import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  void Function()? onButtonClick;
  String text;
  Widget? icon;
  Color backgroundColor;
  Color? borderColor;
  TextStyle? buttonTextStyle;
  CustomElevatedButton(
      {super.key,
      required this.text,
      this.icon,
      this.backgroundColor = AppColors.primaryLight,
      this.buttonTextStyle,
      this.borderColor,
      required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.symmetric(
                vertical: height * 0.02, horizontal: width * 0.04),
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1, color: borderColor ?? Colors.transparent),
                borderRadius: BorderRadius.circular(16))),
        onPressed: onButtonClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox(),
            SizedBox(
              width: width * 0.02,
            ),
            Text(text, style: buttonTextStyle ?? AppStyles.medium20White)
          ],
        ));
  }
}
