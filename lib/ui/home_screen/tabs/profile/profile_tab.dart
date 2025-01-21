import 'package:event_planning_app/providers/app_theme_provider.dart';
import 'package:event_planning_app/ui/auth/login/login_screen.dart';
import 'package:event_planning_app/ui/home_screen/language_bottom_sheet.dart';
import 'package:event_planning_app/ui/home_screen/theme_bottom_sheet.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_language_provider.dart';

class ProfileTab extends StatefulWidget {
  static const String routeName = 'profileTab';
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryLight,
        toolbarHeight: height * 0.185,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(64))),
        title: Row(
          children: [
            Image.asset('assets/Images/routeProfileImage.png'),
            SizedBox(
              width: width * 0.041,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Route Academy',
                  style: AppStyles.bold24White,
                ),
                Text(
                  "route@gmail.com",
                  style: AppStyles.medium16White,
                )
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: AppStyles.semi20Black,
            ),
            SizedBox(height: height * 0.02),
            InkWell(
              onTap: () {
                showLanguageBottomSheet();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primaryLight, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          languageProvider.appLanguage == 'en'
                              ? AppLocalizations.of(context)!.english
                              : AppLocalizations.of(context)!.arabic,
                          style: AppStyles.bold20Primary,
                        ),
                        const Icon(Icons.arrow_drop_down)
                      ]),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Text(
              AppLocalizations.of(context)!.theme,
              style: AppStyles.semi20Black,
            ),
            SizedBox(height: height * 0.02),
            InkWell(
              onTap: () => showThemeBottomSheet(),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primaryLight, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          !themeProvider.isDarkMode()
                              ? AppLocalizations.of(context)!.light
                              : AppLocalizations.of(context)!.dark,
                          style: AppStyles.bold20Primary,
                        ),
                        const Icon(Icons.arrow_drop_down)
                      ]),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.015, horizontal: width * 0.04),
                    backgroundColor: AppColors.redColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginScreen.routeName, (Route<dynamic> route) => false);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      color: AppColors.whiteColor,
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(AppLocalizations.of(context)!.log_out,
                        style: AppStyles.medium16White)
                  ],
                )),
            SizedBox(
              height: height * 0.02,
            )
          ],
        ),
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ThemeBottomSheet(),
    );
  }
}
