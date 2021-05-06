import 'package:flutter/material.dart';
import 'package:tow_projact_flutter_app/shared_ui/navigation_drawer.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter Feed"),
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        itemBuilder: (context, position) {
          return Card(margin:EdgeInsets.all(8),
              child: Column(
            children: [
              _cardHeader(),
              _cardBody(),
              _drawLine(),
              _cardFooter(),
            ],
          ));
        },
        itemCount: 15,
      ),
    );
  }

  Widget _cardHeader() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: CircleAvatar(
            backgroundColor: Colors.deepOrangeAccent,
            radius: 24,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Elshabrawy ziad',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  '@ch_meyers',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Fri, 12 May , 14.30',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _cardBody() {
    return Padding(
      padding: EdgeInsets.only(left: 18, right: 18, bottom: 16),
      child: Text(
        ' Redistributions of source code must retain the above copyrightnotice, this list of conditions and the following disclaimer.',
        style:
            TextStyle(fontSize: 16, height: 1.25, fontWeight: FontWeight.w600,color: Colors.grey.shade800,),
      ),
    );
  }

  Widget _cardFooter() {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,bottom: 10,top: 8,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.repeat,size: 30,),
                color: Colors.orange,
                onPressed: () {},
              ),
              Text(
                '25',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                child: Text(
                  'SHARE',
                  style: TextStyle(color: Colors.orange),
                ),
                onPressed: () {},
              ),
              TextButton(
                child: Text(
                  'OPEN',
                  style: TextStyle(color: Colors.orange),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

 Widget _drawLine() {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
    );
 }


}
