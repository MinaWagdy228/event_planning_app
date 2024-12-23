import 'package:event_planning_app/ui/home_screen/tabs/favorite/favorite_tab.dart';
import 'package:event_planning_app/ui/home_screen/tabs/home/home_tab.dart';
import 'package:event_planning_app/ui/home_screen/tabs/map/map_tab.dart';
import 'package:event_planning_app/ui/home_screen/tabs/profile/profile_tab.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
List<Widget> tabs =[
  HomeTab(),
  MapTab(),
  FavoriteTab(),
  ProfileTab()
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // add event and navigate to add event screen
        },
        child: const Icon(
          Icons.add,
          color: AppColors.whiteColor,
        ),
        shape: RoundedRectangleBorder( // StadiumBorder takes side BorderSide and color and width
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(width: 4, color: AppColors.whiteColor)),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.transparent),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 4,
          color: Theme.of(context).primaryColor,
          child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                buildBottomNavigationBarItems(
                    index: 0,
                    iconSelectedName: "assets/Images/Home_filled.png",
                    iconName: 'assets/Images/Home.png',
                    label: AppLocalizations.of(context)!.home),
                buildBottomNavigationBarItems(
                    index: 1,
                    iconSelectedName: 'assets/Images/location_filled.png',
                    iconName: 'assets/Images/location.png',
                    label: AppLocalizations.of(context)!.location),
                buildBottomNavigationBarItems(
                    index: 2,
                    iconSelectedName: 'assets/Images/favorite_filled.png',
                    iconName: 'assets/Images/favorite.png',
                    label: AppLocalizations.of(context)!.favorite),
                buildBottomNavigationBarItems(
                    index: 3,
                    iconSelectedName: 'assets/Images/profile_filled.png',
                    iconName: 'assets/Images/profile.png',
                    label: AppLocalizations.of(context)!.profile)
              ]),
        ),
      ),
      body: tabs[selectedIndex],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItems(
      {required int index,
      required String iconName,
      required String label,
      required String iconSelectedName}) {
    return BottomNavigationBarItem(
        icon: ImageIcon(
            AssetImage(selectedIndex == index ? iconSelectedName : iconName)),
        label: label);
  }
}
