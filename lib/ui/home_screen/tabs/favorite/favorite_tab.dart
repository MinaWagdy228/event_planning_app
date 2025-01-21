import 'package:event_planning_app/ui/home_screen/tabs/widget/custom_text_field.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../home/event_item_widget.dart';

class FavoriteTab extends StatelessWidget {
  static const String routeName = 'favorite tab';
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.home,
      AppLocalizations.of(context)!.eating,
    ];
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          children: [
            CustomTextField(
              hintText: AppLocalizations.of(context)!.search_hint_text,
              hintStyle: AppStyles.bold14Primary,
              prefixIcon: Icon(Icons.search),
            ),
            SizedBox(height: height * 0.02),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return const EventItemWidget();
                  },
                  separatorBuilder: (context, index) =>
                      SizedBox(height: height * 0.01),
                  itemCount: eventsNameList.length),
            ))
          ],
        ),
      ),
    ));
  }
}
