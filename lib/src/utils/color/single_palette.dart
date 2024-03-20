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

import "package:flutter/painting.dart";
import "color_mixer.dart";

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class SinglePalette {
  //
  //
  //

  final ColorMixer mixer;

  //
  //
  //

  SinglePalette(this.mixer);

  //
  //
  //

  Color? operator [](int value) => this.mixer.getMix(value);

  late Color color0 = this[0]!;
  late Color color50 = this[50]!;
  late Color color100 = this[100]!;
  late Color color200 = this[200]!;
  late Color color300 = this[300]!;
  late Color color400 = this[400]!;
  late Color color500 = this[500]!;
  late Color color600 = this[600]!;
  late Color color700 = this[700]!;
  late Color color800 = this[800]!;
  late Color color900 = this[900]!;
  late Color color1000 = this[1000]!;
}
