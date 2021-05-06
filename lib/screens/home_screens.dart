import 'package:flutter/material.dart';
import 'package:tow_projact_flutter_app/screens/home_tabs/whats_new.dart';
import 'package:tow_projact_flutter_app/shared_ui/navigation_drawer.dart';
import 'home_tabs/whats_new.dart';
import 'home_tabs/popular.dart';
import 'home_tabs/favourites.dart';

class HomeScreens extends StatefulWidget {
  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> with SingleTickerProviderStateMixin {

  TabController tabController;
@override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0,length: 3, vsync: this,);
  }

  @override
  void dispose() {
    tabController.dispose();
  super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: "WHAT’S NEW",
            ),
            Tab(
              text: "POPULAR",
            ),
            Tab(
              text: "FAVOURITES",
            ),
          ],
          controller: tabController,
        ),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: TabBarView(children: [
          WhatsNew(),
          Popular(),
          Favourites(),
        ],controller: tabController,),
      ),
    );
  }
}
