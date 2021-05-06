import 'package:flutter/material.dart';
import 'package:tow_projact_flutter_app/screens/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tow_projact_flutter_app/screens/home_screens.dart';
import 'package:tow_projact_flutter_app/utilitis/app_theme.dart';

int seen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');

  Widget _screen;

  if (seen == null || seen == false) {
    _screen = OnBoarding();
  } else {
    _screen = HomeScreens();
  }

  runApp(
    NewsApp(_screen),
  );
}

class NewsApp extends StatelessWidget {
  final Widget _screen;

  NewsApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: this._screen,
    );
  }
}
