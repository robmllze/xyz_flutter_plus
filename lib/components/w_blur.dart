//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:ui' as ui;
import 'package:flutter/material.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WBlur extends StatelessWidget {
  //
  //
  //

  final double sigma;
  final Widget? child;
  final Color? color;
  final BlendMode blendMode;
  final bool disabled;

  //
  //
  //

  const WBlur({
    super.key,
    this.child,
    this.sigma = 3.0,
    this.color,
    this.blendMode = BlendMode.darken,
    this.disabled = false,
  });

  //
  //
  //

  @override
  Widget build(_) {
    if (child == null) return const SizedBox();
    return ClipRRect(
      child: ImageFiltered(
        imageFilter: ui.ImageFilter.blur(
          sigmaX: sigma,
          sigmaY: sigma,
          tileMode: ui.TileMode.clamp,
        ),
        child: Stack(
          fit: StackFit.loose,
          alignment: Alignment.center,
          children: [
            if (this.color != null)
              ColorFiltered(
                colorFilter: ui.ColorFilter.mode(
                  this.color!,
                  this.blendMode,
                ),
                child: child!,
              )
            else
              child!,
            if (disabled)
              Container(
                color: Colors.transparent,
              ),
          ],
        ),
      ),
    );
  }
}