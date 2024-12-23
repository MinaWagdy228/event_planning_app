import 'package:event_planning_app/ui/home_screen/tabs/home/event_item_widget.dart';
import 'package:event_planning_app/ui/home_screen/tabs/home/tab_event_widget.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = 'home tab';
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.welcome_back,
                    style: AppStyles.regular14White),
                Text("Route Academy", style: AppStyles.bold24White)
              ],
            ),
            Row(
              children: [
                const Icon(Icons.sunny, color: AppColors.whiteColor),
                SizedBox(
                  width: width * 0.02,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02, vertical: height * 0.01),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.whiteColor),
                  child: Text(
                    AppLocalizations.of(context)!.lang,
                    style: AppStyles.bold14Primary,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.04, vertical: height * 0.01),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35))),
            height: height * 0.15,
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/Images/location.png"),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      "Cairo, Egypt",
                      style: AppStyles.medium14White,
                    )
                  ],
                ),
                DefaultTabController(
                    length: eventsNameList.length,
                    child: TabBar(
                        onTap: (index) {
                          selectedIndex = index;
                          setState(() {});
                        },
                        tabAlignment: TabAlignment.start,
                        labelPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.01, vertical: height * 0.02),
                        indicatorColor: AppColors.transparentColor,
                        dividerColor: AppColors.transparentColor,
                        isScrollable: true,
                        tabs: eventsNameList.map(
                          (eventName) {
                            return TabEventWidget(
                                eventName: eventName,
                                isSelected: eventsNameList.indexOf(eventName) ==
                                        selectedIndex
                                    ? true
                                    : false);
                          },
                        ).toList()))
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
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
    );
  }
}
