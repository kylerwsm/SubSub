import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:furniture_app/screens/details.dart';
import 'package:furniture_app/util/data.dart';
// import 'package:furniture_app/widgets/badge.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static Icon _lightIcon = new Icon(FontAwesomeIcons.solidStar);
  static Icon _darkIcon = new Icon(FontAwesomeIcons.solidMoon);

  // final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<bool>(context);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Center(
            child: GestureDetector(
                child: isDark ? _lightIcon : _darkIcon,
                onTap: Provider.of<VoidCallback>(context)),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              "What do you want to\ntranscript today?",
              style: TextStyle(
                fontSize: 32,
                fontFamily: "Helvetica",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  side: BorderSide(color: isDark ? const Color(0xff43464b) : Colors.transparent)
                  ),
              elevation: 6.0,
              color: isDark ? const Color(0xff111111) : Colors.white,
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: Icon(
                      Feather.getIconData("upload"),
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Upload your video here, and\nit will be SubSub-ed!',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.w600,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50),
          Text("SubSub-ed Transcripts",
              style: TextStyle(
                fontSize: 23,
                fontFamily: "Helvetica",
                fontWeight: FontWeight.w800,
              )),
          // Container(
          //   height: 275,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     shrinkWrap: true,
          //     itemCount: furnitures.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       Map furniture = furnitures[index];
          //       return Padding(
          //         padding: EdgeInsets.only(right: 20),
          //         child: GestureDetector(
          //           onTap: () {
          //             Navigator.of(context).push(
          //               MaterialPageRoute(
          //                 builder: (BuildContext context) {
          //                   return Details();
          //                 },
          //               ),
          //             );
          //           },
          //           child: Container(
          //             height: 275,
          //             width: 280,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: <Widget>[
          //                 Text(
          //                   furniture['name'],
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 20,
          //                   ),
          //                 ),
          //                 SizedBox(height: 10),
          //                 ClipRRect(
          //                   borderRadius: BorderRadius.circular(15),
          //                   child: Image.asset(
          //                     "${furniture["img"]}",
          //                     height: 240,
          //                     width: 280,
          //                     fit: BoxFit.cover,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          // SizedBox(height: 20),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     Text(
          //       "Popular Products",
          //       style: TextStyle(
          //         fontSize: 23,
          //         fontWeight: FontWeight.w800,
          //       ),
          //     ),
          //     FlatButton(
          //       child: Text(
          //         "View More",
          //         style: TextStyle(
          //           color: Colors.grey,
          //         ),
          //       ),
          //       onPressed: () {},
          //     ),
          //   ],
          // ),
          // Container(
          //   height: 140,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     shrinkWrap: true,
          //     itemCount: furnitures.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       Map furniture = furnitures[index];
          //       return Padding(
          //         padding: EdgeInsets.only(right: 20),
          //         child: GestureDetector(
          //           onTap: () {
          //             Navigator.of(context).push(
          //               MaterialPageRoute(
          //                 builder: (BuildContext context) {
          //                   return Details();
          //                 },
          //               ),
          //             );
          //           },
          //           child: Container(
          //             height: 140,
          //             width: 140,
          //             child: ClipRRect(
          //               borderRadius: BorderRadius.circular(15),
          //               child: Image.asset(
          //                 "${furniture["img"]}",
          //                 height: 140,
          //                 width: 140,
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
