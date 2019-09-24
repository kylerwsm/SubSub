import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_app/screens/home.dart';
// import 'package:furniture_app/screens/main_screen.dart';
import 'package:furniture_app/util/const.dart';
import 'package:provider/provider.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() async {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((_) {
  //   runApp(MyApp());
  // });
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDark = false;

  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: _isDark ? Constants.darkPrimary : Constants.lightPrimary,
    //   statusBarIconBrightness: _isDark ? Brightness.light : Brightness.dark,
    // ));
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.initState();
  }

  void toggleMode() {
    setState(() {
      _isDark = !_isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider<VoidCallback>.value(
      value: toggleMode,
      child: Provider<bool>.value(
        value: _isDark,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Constants.appName,
          theme: _isDark ? Constants.darkTheme : Constants.lightTheme,
          home: Home(),
        ),
      ),
    );
  }
}
