import 'package:event_planning_app/ui/home_screen/theme_bottom_sheet.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../providers/app_language_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                languageProvider.changeLanguage('en');
                // setState(() {
                //
                // });
              },
              child: languageProvider.appLanguage == 'en'
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.english)
                  : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.english)),
          SizedBox(height: height * 0.02),
          InkWell(
              onTap: () {
                languageProvider.changeLanguage('ar');
                // setState(() {
                //
                // });
              },
              child: languageProvider.appLanguage == 'ar'
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
                  : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.arabic))
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
