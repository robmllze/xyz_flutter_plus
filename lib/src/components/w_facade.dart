//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// X|Y|Z & Dev 
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
// 
// Licensing details can be found in the LICENSE file in the root directory.
// 
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';
import 'w_blur.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WFacade {
  //
  //
  //

  final ui.Image? image;
  final double blurSigma;
  final Widget? child;

  //
  //
  //

  const WFacade({
    this.image,
    this.child,
    this.blurSigma = 0.0,
  });

  //
  //
  //

  WFacade copyWith({
    ui.Image? image,
    double? blurSigma,
    Color? blurColor,
    Widget? child,
  }) {
    return WFacade(
      image: image ?? this.image,
      blurSigma: blurSigma ?? this.blurSigma,
      child: child ?? this.child,
    );
  }

  //
  //
  //

  Widget draw() {
    return Stack(
      fit: StackFit.expand,
      children: [
        WBlur(
          sigma: blurSigma,
          child: RawImage(
            fit: BoxFit.fill,
            image: image,
          ),
        ),
        if (child != null) child!,
      ],
    );
  }
}