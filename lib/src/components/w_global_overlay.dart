//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WGlobalOverlay extends StatefulWidget {
  //
  //
  //

  final double x;
  final double y;
  final Widget child;

  //
  //
  //

  const WGlobalOverlay({
    super.key,
    required this.x,
    required this.y,
    required this.child,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WGlobalOverlay> {
  //
  //
  //

  late final OverlayEntry _overlayEntry;

  //
  //
  //

  @override
  void initState() {
    super.initState();
    this._createOverlayEntry();
  }

  //
  //
  //

  @override
  void dispose() {
    this._overlayEntry.remove();
    super.dispose();
  }

  //
  //
  //

  void _createOverlayEntry() {
    this._overlayEntry = OverlayEntry(
      builder: (final context) {
        return Positioned(
          top: widget.y,
          left: widget.x,
          child: widget.child,
        );
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(_overlayEntry);
    });
  }

  //
  //
  //

  @override
  Widget build(_) => const SizedBox.shrink();
}
