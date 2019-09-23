import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
// import 'package:furniture_app/screens/details.dart';
// import 'package:furniture_app/util/data.dart';
// import 'package:furniture_app/widgets/badge.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/templates/action_button.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static Icon _lightIcon = new Icon(Feather.getIconData("eye"));
  static Icon _darkIcon = new Icon(FontAwesomeIcons.solidMoon);
  var mediaFile;

  getProgressDialog() {
    return Center(child: CircularProgressIndicator());
  }

  Future<void> _uploadMedia() async {
    setState(() => mediaFile = ImagePicker.pickVideo(source: ImageSource.gallery));
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<bool>(context);
    var buttonWidth = MediaQuery.of(context).size.width * 0.6;

    var uploadMediaButton = Align(
      alignment: Alignment.center,
      child: ActionButton(
        onPressed: _uploadMedia,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(
                  color:
                      isDark ? const Color(0xff43464b) : Colors.transparent)),
          elevation: 6.0,
          color: isDark ? const Color(0xff111111) : Colors.white,
          child: Container(
            width: buttonWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Icon(
                    Feather.getIconData("radio"),
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Upload Media',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Helvetica",
                      fontWeight: FontWeight.w400,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    var liveButton = Align(
      alignment: Alignment.center,
      child: ActionButton(
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(
                  color:
                      isDark ? const Color(0xff43464b) : Colors.transparent)),
          elevation: 6.0,
          color: isDark ? const Color(0xff111111) : Colors.white,
          child: Container(
            width: buttonWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Icon(
                    Feather.getIconData("mic"),
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Live Transcript',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Helvetica",
                      fontWeight: FontWeight.w400,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    var buttons = [uploadMediaButton, liveButton];

    return Scaffold(
      appBar:
          PreferredSize(child: AppBar(), preferredSize: Size.fromHeight(0.0)),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "What do you want to transcript today?",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                        child: isDark ? _lightIcon : _darkIcon,
                        onTap: Provider.of<VoidCallback>(context)),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: buttons.length,
                    itemBuilder: (BuildContext context, int index) {
                      return index == buttons.length - 1
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: buttons[(index.abs()) % buttons.length],
                            )
                          : Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: buttons[(index.abs()) % buttons.length],
                            );
                    })),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("SubSub-ed Transcripts",
                  style: TextStyle(
                    fontSize: 23,
                    fontFamily: "Helvetica",
                    fontWeight: FontWeight.w800,
                  )),
            ),
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
      ),
    );
  }
}
