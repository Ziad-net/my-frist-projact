import 'package:flutter/material.dart';
import 'package:tow_projact_flutter_app/models/nav_menu.dart';
import 'package:tow_projact_flutter_app/screens/home_screens.dart';
import 'package:tow_projact_flutter_app/screens/headline_news.dart';
import 'package:tow_projact_flutter_app/screens/twitter_feed.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<NavMenuItem> navigationMenu = [
    NavMenuItem("Explore", () => HomeScreens() ),
    NavMenuItem("Headline News", () => HeadLineNews() ),
    NavMenuItem('Twitter Feed', () => TwitterFeed() )
  ];

  List<String> navMenu = [
    'Explore',
    'HeadLine News',
    'Read Later',
    'Videos',
    'Photos',
    'Setting',
    'logout',
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 80, left: 24),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return ListTile(
              title: Text(
                navigationMenu[position].title,
                style: TextStyle(color: Colors.grey.shade700, fontSize: 22),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey.shade400,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                   navigationMenu[position].destination(),
                ));
              },
            );
          },
          itemCount: navigationMenu.length,
        ),
      ),
    );
  }
}
