import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:uttam_practical_7_1_2021/controller/home_controller.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends StateMVC<Home> {
  TextEditingController sizetext = TextEditingController();
  HomeimageController _con;
  _HomeState() : super(HomeimageController()) {
    _con = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: sizetext,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      color: Colors.blue[800],
                      onPressed: () {
                        if (sizetext.text != null) {
                          _con.getImage(sizetext.text);
                        }
                      },
                      child: Text(
                        'Get',
                        textScaleFactor: 1.2,
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
          _con.datum != null
              ? Expanded(
                  child:
                      //   StaggeredGridView.countBuilder(
                      //   padding: const EdgeInsets.all(4.0),
                      //   mainAxisSpacing: 4.0,
                      //   crossAxisSpacing: 4.0,
                      //   crossAxisCount:6,
                      //   itemCount: _con.datum.length,
                      //   itemBuilder: (BuildContext context, int index) {
                      //     if (index % 2 == 0) {
                      //       return Container(
                      //         decoration: BoxDecoration(
                      //             color: Colors.grey[600],
                      //             borderRadius: BorderRadius.circular(2),
                      //             border:
                      //                 Border.all(color: Colors.grey[600], width: 4)),
                      //         child: ClipRRect(
                      //             borderRadius: BorderRadius.circular(4),
                      //             child: CachedNetworkImage(
                      //               fit: BoxFit.cover,
                      //               imageUrl: _con.datum[index].imageUrl,
                      //               placeholder: (context, url) =>
                      //                   Center(child: CircularProgressIndicator()),
                      //               errorWidget: (context, url, error) =>
                      //                   Icon(Icons.error),
                      //             )),
                      //       );
                      //     } else {
                      //       return Container(
                      //         decoration: BoxDecoration(
                      //             color: Colors.grey[600],
                      //             borderRadius: BorderRadius.circular(2),
                      //             border:
                      //                 Border.all(color: Colors.grey[600], width: 4)),
                      //         child: ClipRRect(
                      //             borderRadius: BorderRadius.circular(4),
                      //             child: CachedNetworkImage(
                      //               fit: BoxFit.cover,
                      //               imageUrl: _con.datum[index].imageUrl,
                      //               placeholder: (context, url) =>
                      //                   Center(child: CircularProgressIndicator()),
                      //               errorWidget: (context, url, error) =>
                      //                   Icon(Icons.error),
                      //             )),
                      //       );
                      //     }
                      //   },
                      //   staggeredTileBuilder: (int index) => index % 2 == 0
                      //       ? new StaggeredTile.fit(2)
                      //       : new StaggeredTile.fit(1),
                      // )

                      GridView.builder(
                    padding: const EdgeInsets.all(4.0),
                    scrollDirection: Axis.vertical,
                    itemCount: _con.datum.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1.2),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[600],
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: Colors.grey[600], width: 6)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: _con.datum[index].imageUrl,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                )),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child: Text('Please enter Data'),
                ),
        ],
      ),
    );
  }
}
