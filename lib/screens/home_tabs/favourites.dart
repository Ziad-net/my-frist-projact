import 'dart:math';

import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Color> colorsList = [
    Colors.red,
    Colors.cyan,
    Colors.deepPurple,
    Colors.green,
    Colors.lightGreenAccent,
    Colors.pink,
    Colors.limeAccent
  ];

  Random random = Random();

  Color _getRandomColor() {
    return colorsList[random.nextInt(colorsList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                _authoerRow(),
                SizedBox(height: 16,),
                _newsItemRow(),
              ],
            ),
          ),
        );
      },
      itemCount: 15,
    );
  }

  Widget _authoerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage('assets/images/zoz.jpg'),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle),
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 16),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Zeyad Mahmoud',
                  style: TextStyle(color: Colors.grey,),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      '15 min.',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Life Style',
                      style: TextStyle(
                        color: _getRandomColor(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border),
          onPressed: () {},
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _newsItemRow() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage('assets/images/black.jpg'),fit: BoxFit.cover),),
          width: 124,
          height: 124,
          margin:EdgeInsets.only(right: 16) ,
        ),
        Expanded(
          child: Column(
            children: [
              Text('Running Gradle task assembleDebug...',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
              Text(' Debug service listening on ws: Syncing files to device Android SDK built for eglMakeCurrent',
              style: TextStyle(color: Colors.grey,fontSize: 16,height: 1.25,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
