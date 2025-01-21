import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/providers/app_language_provider.dart';
import 'package:event_planning_app/providers/app_theme_provider.dart';
import 'package:event_planning_app/ui/auth/login/login_screen.dart';
import 'package:event_planning_app/ui/auth/register/register_screen.dart';
import 'package:event_planning_app/ui/home_screen/home_screen.dart';
import 'package:event_planning_app/ui/home_screen/tabs/favorite/favorite_tab.dart';
import 'package:event_planning_app/ui/home_screen/tabs/home/add_Event/add_event.dart';
import 'package:event_planning_app/ui/home_screen/tabs/home/home_tab.dart';
import 'package:event_planning_app/ui/home_screen/tabs/map/map_tab.dart';
import 'package:event_planning_app/ui/home_screen/tabs/profile/profile_tab.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'firebase_options.dart';
import 'utils/app_Theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork(); // offline
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => AppThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AppLanguageProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        ProfileTab.routeName: (context) => const ProfileTab(),
        HomeTab.routeName: (context) => const HomeTab(),
        FavoriteTab.routeName: (context) => const FavoriteTab(),
        MapTab.routeName: (context) => const MapTab(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        AddEvent.routeName: (context) => AddEvent()
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales, // sets you language
      locale: Locale(languageProvider.appLanguage),
    );
  }
}
