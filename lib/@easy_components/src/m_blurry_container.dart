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

import 'dart:ui' show ImageFilter;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MBlurryContainer extends StatelessWidget {
  //
  //
  //

  final Widget? child;
  final double? sigma;
  final double opacity;
  final BorderRadius borderRadius;
  final BoxConstraints constraints;
  final BoxDecoration decoration;
  final EdgeInsets? padding;
  final Color? color;
  final double? width;
  final double? height;

  //
  //
  //

  const MBlurryContainer({
    super.key,
    this.child,
    this.sigma = 8.0,
    this.opacity = 0.75,
    this.borderRadius = BorderRadius.zero,
    this.constraints = const BoxConstraints(),
    this.decoration = const BoxDecoration(),
    this.padding,
    this.color,
    this.height,
    this.width,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final color1 = this.color ?? Theme.of(context).colorScheme.surfaceContainer;
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: this.sigma!,
          sigmaY: this.sigma!,
        ),
        child: Container(
          width: width,
          height: height,
          constraints: this.constraints,
          decoration: this.decoration.copyWith(
                color: color1.withOpacity(color1.opacity * opacity),
                borderRadius: borderRadius,
              ),
          padding: this.padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}
