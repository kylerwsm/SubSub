import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:furniture_app/util/data.dart';
// import 'package:furniture_app/widgets/badge.dart';

class Details extends StatefulWidget {
  final title;
  final content;

  Details({this.title, this.content});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: widget.title,), body: Container());
  }
}
