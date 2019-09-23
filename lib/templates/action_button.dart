import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;

  ActionButton({this.child, this.onPressed});

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton>
    with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    widget.onPressed();
  }

  void _onTap() async {
    _controller.forward();
    await Future.delayed(Duration(milliseconds: 50));
    _controller.reverse();
    await Future.delayed(Duration(milliseconds: 50));
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTap: _onTap,
      onTapCancel: () => _controller.reverse(),
      child: Transform.scale(
        scale: _scale,
        child: _collectionCardUI,
      ),
    );
  }

  Widget get _collectionCardUI => Container(
        child: widget.child);
}
