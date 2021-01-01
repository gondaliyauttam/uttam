import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/controller/listcontroller.dart';
import 'package:flutter_task/widget/custom_drawer.dart';
import 'package:flutter_task/widget/navbar.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends StateMVC<Homepage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  ListController _con;
  _HomepageState() : super(ListController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: CustomDrawer(),
      appBar: Navbar(
          onPressed: () {
            _drawerKey.currentState.openDrawer();
          },
          image: 'assets/flutter_logo.png'),
      body: ListView.builder(
        // shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: _con.datum.length,
        itemBuilder: (BuildContext context, int index) {
          return Containerwidget(
            title: _con.datum[index].name,
            image: _con.datum[index].profileImageUrl,
            details: _con.datum[index].firstname,
          );
        },
      ),
    );
  }
}

class Containerwidget extends StatelessWidget {
  final String image;
  final String title;
  final String details;
  const Containerwidget({
    Key key,
    this.image,
    this.title,
    this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child:
                  // Image.asset('assets/flutter_logo.png')
                  CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
                width: 90,
                height: 90,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  details,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 14,
                    // fontFamily: 'Shruti'
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
