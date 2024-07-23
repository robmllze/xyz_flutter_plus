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

class MHoverScaler extends StatefulWidget {
  //
  //
  //

  final double hoverScale;
  final Duration duration;
  final Widget child;

  //
  //
  //

  const MHoverScaler({
    super.key,
    this.hoverScale = 1.2,
    this.duration = const Duration(milliseconds: 200),
    required this.child,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<MHoverScaler> {
  //
  //
  //

  bool _isHovered = false;

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (isHovered) {
        this.setState(() {
          this._isHovered = isHovered;
        });
      },
      child: AnimatedContainer(
        duration: this.widget.duration,
        transform: Matrix4.identity()
          ..scale(
            this._isHovered ? this.widget.hoverScale : 1.0,
          ),
        child: this.widget.child,
      ),
    );
  }
}
