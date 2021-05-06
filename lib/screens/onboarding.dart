import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screens.dart';
import '../pagemodel.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {


  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);
  List<PageModel> pages = <PageModel>[
 // void _addPages() {
    PageModel('Welcome!',
        'Paragraph 111 This is my frist projact i want to whirt lab lab lab ay haga ya3ny fahem ya 3am anta wa howaa!'),
    PageModel('Next Bage',
        'Paragraph 222 This is my frist projact i want to whirt lab lab lab ay haga ya3ny fahem ya 3am anta wa howaa!'),
    PageModel('Third Bage',
        'Paragraph 333 This is my frist projact i want to whirt lab lab lab ay haga ya3ny fahem ya 3am anta wa howaa!'),
    PageModel('Last Bage',
        'Paragraph 444 This is my frist projact i want to whirt lab lab lab ay haga ya3ny fahem ya 3am anta wa howaa!'),
  //}
];
  @override
  Widget build(BuildContext context) {

    //_addPages();

    return Scaffold(
      body: Stack(children: <Widget>[
        PageView.builder(
          itemBuilder: (context, index) {
            return Stack(
              children: <Widget>[
                Container(
                  color: Colors.teal,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Transform.translate(
                      child: Icon(
                        Icons.api,
                        size: 150,
                        color: Colors.white,
                      ),
                      offset: Offset(0, -100),
                    ),
                    Text(
                      pages[index].titles,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 45, right: 45, top: 15),
                      child: Text(
                        pages[index].paragraph,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
          itemCount: pages.length,
          onPageChanged: (index) {
            _pageViewNotifier.value = index;
          },
        ),
        Transform.translate(
          offset: Offset(0, 175),
          child: Align(
            alignment: Alignment.center,
            child: _displayPageIndicator(pages.length),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              left: 35,
              right: 35,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              // ignore: deprecated_member_use
              child: RaisedButton(
                color: Colors.red.shade800,
                child: Text(
                  'GET STARTED',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 1.0,
                  ),
                ),
                onPressed: () {
                  Navigator //.of(context).popAndPushNamed();
                      .push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        _updateSeen();
                        return HomeScreens();
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget _displayPageIndicator(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }
}

void _updateSeen() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('seen', true);
}
