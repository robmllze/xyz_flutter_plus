//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/material.dart';

import '/utils/units/units.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WIconButton extends StatelessWidget {
  //
  //
  //

  final Widget icon;
  final void Function()? onTap;

  //
  //
  //

  const WIconButton({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  //
  //
  //

  @override
  Widget build(_) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: this.onTap != null ? (_) => this.onTap?.call() : null,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: $48,
          minWidth: $48,
        ),
        child: Opacity(
          opacity: this.onTap != null ? 1.0 : 0.5,
          child: this.icon,
        ),
      ),
    );
  }
}
