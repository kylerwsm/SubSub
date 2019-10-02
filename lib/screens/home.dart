import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:furniture_app/screens/details.dart';
// import 'package:furniture_app/util/data.dart';
// import 'package:furniture_app/widgets/badge.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/templates/action_button.dart';
import 'package:furniture_app/templates/basic_dialogs.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
// import 'dart:convert';
import 'package:furniture_app/services/speech_to_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static Icon _lightIcon = new Icon(Feather.getIconData("eye"));
  static Icon _darkIcon = new Icon(FontAwesomeIcons.solidMoon);
  var _filePath;
  var transcripts;
  SpeechToText _stt;

  @override
  void initState() {
    transcripts = [
      "Transcript on 25/09/19, 13:39",
      "Transcript on 02/08/19, 12:02",
      "Transcript on 12/06/18, 01:39",
      "Transcript on 30/01/18, 22:03"
    ];
    super.initState();
  }

  getProgressDialog() {
    return Center(child: CircularProgressIndicator());
  }

  void getImage() async {
    _filePath = await ImagePicker.pickVideo(source: ImageSource.gallery);
    String path = _filePath != null ? _filePath.path : "None";
    print('File Path Retrieved: ' + path);
    _stt = SpeechToText(vidPath: path);
    _stt.extractAudio();
    // if (image != null) {
    //   setState(() {
    //     _filePath = image;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<bool>(context);
    var buttonWidth = MediaQuery.of(context).size.width * 0.6;

    var uploadMediaButton = Align(
      alignment: Alignment.center,
      child: ActionButton(
        onPressed: getImage,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0)),
          elevation: 0.0,
          color: Theme.of(context).buttonColor,
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
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Upload Media',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Helvetica",
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).iconTheme.color,
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
        onPressed: () => BasicDialogs().showUnavailableDialog(context),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0)),
          elevation: 0.0,
          color: Theme.of(context).buttonColor,
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
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Live Transcript',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Helvetica",
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).iconTheme.color,
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
                    // shrinkWrap: true,
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
            SizedBox(height: 5),
            Opacity(
              opacity: 0.7,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Tap to view. Slide left or right to delete.",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Helvetica",
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: transcripts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = transcripts[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Dismissible(
                        key: Key(item),
                        // Show a red background as the item is swiped away.
                        // background: Container(color: Colors.red),
                        onDismissed: (direction) {
                          setState(() {
                            transcripts.removeAt(index);
                          });
                          Scaffold.of(context).showSnackBar(SnackBar(
                              action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () => setState(
                                      () => transcripts.insert(index, item))),
                              content: Text('Transcript deleted',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Helvetica",
                                    fontWeight: FontWeight.w500,
                                  ))));
                        },
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return Details(title: Text(item));
                                },
                              ),
                            );
                          },
                          child: Card(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10),
                                side: BorderSide(color: Colors.transparent)),
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    color: Theme.of(context).buttonColor,
                                    height: 60,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                  ),
                                ),
                                Container(
                                  color: Colors.transparent,
                                  height: 60,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(item,
                                        style: TextStyle(
                                          color: Theme.of(context).iconTheme.color,
                                          fontSize: 16,
                                          fontFamily: "Helvetica",
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
