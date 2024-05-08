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

class WCollapsable extends StatefulWidget {
  //
  //
  //

  final Widget? child;
  final bool collapsed;
  final bool shouldEnableStaticMode;

  //
  //
  //

  const WCollapsable({
    super.key,
    this.collapsed = false,
    this.child,
    this.shouldEnableStaticMode = true,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WCollapsable> with SingleTickerProviderStateMixin {
  //
  //
  //

  late final _ctrlAnimation = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );

  //
  //
  //

  late final _animation = CurvedAnimation(
    parent: this._ctrlAnimation,
    curve: Curves.fastOutSlowIn,
  );

  //
  //
  //

  @override
  void initState() {
    super.initState();
    if (this.widget.shouldEnableStaticMode) {
      this._handleAnimationState(fromReverse: 0.0, fromForward: 1.0);
    } else {
      this._handleAnimationState();
    }
  }

  //
  //
  //

  @override
  void didUpdateWidget(WCollapsable old) {
    super.didUpdateWidget(old);
    this._handleAnimationState();
  }

  //
  //
  //

  void _handleAnimationState({double? fromReverse, double? fromForward}) {
    if (this.widget.collapsed) {
      this._ctrlAnimation.reverse(from: fromReverse);
    } else {
      this._ctrlAnimation.forward(from: fromForward);
    }
  }

  //
  //
  //

  @override
  void dispose() {
    this._ctrlAnimation.dispose();
    super.dispose();
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: this._animation,
      child: SizeTransition(
        axisAlignment: 1.0,
        sizeFactor: this._animation,
        child: this.widget.child,
      ),
    );
  }
}
