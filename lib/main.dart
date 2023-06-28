import 'package:bhagvad_gita_flutter_app/view/screens/all_verses_page.dart';
import 'package:bhagvad_gita_flutter_app/view/screens/home_page.dart';
import 'package:bhagvad_gita_flutter_app/view/screens/shlok_details_page.dart';
import 'package:bhagvad_gita_flutter_app/view/screens/splash_screen.dart';
import 'package:bhagvad_gita_flutter_app/view/screens/unit_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Modals/theme_modals.dart';
import 'Provider/jason_decode_provider.dart';
import 'Provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isDark = prefs.getBool('appTheme') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(
            themeModel: ThemeModel(
              isDark: isDark,
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ChapterJsonDecodeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShlokJsonDecodeProvider(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: (Provider.of<ThemeProvider>(context).themeModel.isDark)
            ? ThemeMode.dark
            : ThemeMode.light,
        routes: {
          '/': (context) => const SplashScreen(),
          'home_Page': (context) => const HomePage(),
          'unit_details_page': (context) => const UnitDetailsPage(),
          'all_verses_page': (context) => const AllVersesPage(),
          'shlok_detail_page': (context) => const ShlokDetailPage(),
        },
      ),
    ),
  );
}
