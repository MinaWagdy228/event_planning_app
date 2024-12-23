import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../providers/app_theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}
class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  // @override
  // void initState() {
  //   getMode();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                themeProvider.changeTheme(ThemeMode.light);
                // setState(() {
                //
                // });
              },
              child: !themeProvider.isDarkMode()
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.light)
                  : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.light)),
          SizedBox(height: height * 0.02),
          InkWell(
              onTap: () {
                themeProvider.changeTheme(ThemeMode.dark);
                // setState(() {
                //
                // });
              },
              child: themeProvider.isDarkMode()
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                  : getUnSelectedItemWidget(AppLocalizations.of(context)!.dark))
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppStyles.bold20Primary,
        ),
        Icon(
          Icons.check,
          size: 25,
          color: AppColors.primaryLight,
        )
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Text(text, style: AppStyles.semi20Black);
  }

}
