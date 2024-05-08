//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/material.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WAnimatedFade extends StatefulWidget {
  //
  //
  //

  final Widget? layer1;
  final Widget layer2;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final Function()? onComplete;
  final double begin;
  final double end;

  //
  //
  //

  const WAnimatedFade({
    super.key,
    this.layer1,
    required this.layer2,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.linear,
    this.begin = 0.0,
    this.end = 1.0,
    this.onComplete,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WAnimatedFade> with SingleTickerProviderStateMixin {
  //
  //
  //

  late final _controller = AnimationController(
    vsync: this,
    duration: this.widget.duration,
  );

  //
  //
  //

  late final _animation = Tween<double>(
    begin: this.widget.begin,
    end: this.widget.end,
  ).animate(
    CurvedAnimation(
      parent: this._controller,
      curve: this.widget.curve,
    ),
  );

  //
  //
  //

  @override
  void initState() {
    super.initState();
    if (this.widget.delay.inMicroseconds == 0) {
      this._controller.forward();
    } else {
      Future.delayed(this.widget.delay, () => this._controller.forward());
    }
    this._controller.addListener(() {
      if (this._controller.isCompleted) {
        this.widget.onComplete?.call();
      }
    });
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
    final layer1 = this.widget.layer1;
    final layer2 = this.widget.layer2;
    return Stack(
      children: [
        if (layer1 != null) layer1,
        FadeTransition(
          opacity: this._animation,
          child: layer2,
        ),
      ],
    );
  }
}
