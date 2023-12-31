//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/material.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WAnimatedSize extends StatefulWidget {
  //
  //
  //

  final Widget child;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final double begin;
  final double end;
  final WAnimatedResize_Direction direction;

  //
  //
  //

  const WAnimatedSize({
    Key? key,
    required this.child,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.linear,
    this.begin = 0.5,
    this.end = 1.0,
    this.direction = WAnimatedResize_Direction.TOP_TO_BOTTOM,
  }) : super(key: key);

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WAnimatedSize> with SingleTickerProviderStateMixin {
  //
  //
  //

  late final AnimationController _controller;
  late final Animation<double> _animation;

  //
  //
  //

  @override
  void initState() {
    super.initState();
    this._controller = AnimationController(
      vsync: this,
      duration: this.widget.duration,
    );
    Future.delayed(this.widget.delay, () => this._controller.forward());
    this._animation = Tween<double>(
      begin: this.widget.begin,
      end: this.widget.end,
    ).animate(
      CurvedAnimation(
        parent: this._controller,
        curve: this.widget.curve,
      ),
    );
  }

  //
  //
  //

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //
  //
  //

  @override
  Widget build(_) {
    Axis axis;
    double axisAlignment;

    switch (widget.direction) {
      case WAnimatedResize_Direction.TOP_TO_BOTTOM:
        axis = Axis.vertical;
        axisAlignment = -1.0;
        break;
      case WAnimatedResize_Direction.BOTTOM_TO_TOP:
        axis = Axis.vertical;
        axisAlignment = 1.0;
        break;
      case WAnimatedResize_Direction.LEFT_TO_RIGHT:
        axis = Axis.horizontal;
        axisAlignment = -1.0;
        break;
      case WAnimatedResize_Direction.RIGHT_TO_LEFT:
        axis = Axis.horizontal;
        axisAlignment = 1.0;
        break;
      case WAnimatedResize_Direction.CENTER:
        axis = Axis.horizontal;
        axisAlignment = 0.0;
        break;
    }

    return SizeTransition(
      sizeFactor: this._animation,
      axisAlignment: axisAlignment,
      axis: axis,
      child: this.widget.child,
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum WAnimatedResize_Direction {
  TOP_TO_BOTTOM,
  BOTTOM_TO_TOP,
  LEFT_TO_RIGHT,
  RIGHT_TO_LEFT,
  CENTER,
}
