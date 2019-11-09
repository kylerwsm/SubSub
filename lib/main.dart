import 'package:flutter/material.dart';
import 'package:subsub/screens/home.dart';
import 'package:subsub/util/const.dart';
import 'package:provider/provider.dart';

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
