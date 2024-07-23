//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/widgets.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WAnimatedScale extends StatefulWidget {
  //
  //
  //

  final Widget child;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final double begin;
  final double end;
  final Alignment alignment;

  //
  //
  //

  const WAnimatedScale({
    super.key,
    required this.child,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.linear,
    this.begin = 0.75,
    this.end = 1.0,
    this.alignment = Alignment.center,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WAnimatedScale> with SingleTickerProviderStateMixin {
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
    this._controller.dispose();
    super.dispose();
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: this._animation,
      alignment: this.widget.alignment,
      child: this.widget.child,
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum Direction {
  TOP_TO_BOTTOM,
  BOTTOM_TO_TOP,
  LEFT_TO_RIGHT,
  RIGHT_TO_LEFT,
  CENTER,
}
