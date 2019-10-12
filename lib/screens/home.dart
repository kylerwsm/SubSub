import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:furniture_app/screens/details.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/templates/action_button.dart';
import 'package:furniture_app/templates/basic_dialogs.dart';
import 'package:image_picker/image_picker.dart';
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
      "Sample Transcript",
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

    if (path == null) {
      _stt = SpeechToText(vidPath: path);
      _stt.extractAudio();
    } else {
      print('No media is picked by the user');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<bool>(context);
    var buttonWidth = MediaQuery.of(context).size.width * 0.9;

    var whatIsSubSubButton = ActionButton(
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return Details(title: Text('What is SubSub?'), content: 'Living in the ever-globalising world, it has become a norm and necessity for us to be able to communicate across culture and language barriers. As local university students in Singapore, we are exposed to our globalised teaching community and peers. You see, even in the same language, accents alone can pose a challenging problem in our ability to absorb information verbally. This will be especially true for our peers who are exchange students. We want to alleviate this problem using technology, and this is what motivates us everyday at SubSub.\n\nHere at SubSub, we believe in an inclusive society. The advancement and introduction of technology should never change that. We aim to improve ways people can consume media by leveraging on existing technologies. Specifically, to do this, we are looking into revolutionalising the usage of off-the-shelf speech-to-text, text-to-speech, and translation technologies.\n\nSubSub is Made by Students, for Students.\n\nStay tuned to find out more.');
          },
        ),
      ),
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
                  Feather.getIconData("help-circle"),
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'What is SubSub?',
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
    );
    var uploadMediaButton = ActionButton(
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
    );
    var liveButton = ActionButton(
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
    );

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
            Column(
              children: <Widget>[
                whatIsSubSubButton,
                SizedBox(height: 10),
                uploadMediaButton,
                SizedBox(
                  height: 10,
                ),
                liveButton
              ],
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Transcripts',
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
                child: Text("Tap to view. Swipe to delete.",
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
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: transcripts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = transcripts[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Dismissible(
                        key: Key(item),
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
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                                Container(
                                  color: Colors.transparent,
                                  height: 60,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(item,
                                        style: TextStyle(
                                          color:
                                              Theme.of(context).iconTheme.color,
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
