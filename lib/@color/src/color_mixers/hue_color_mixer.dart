//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:ui' show Color;

import 'package:flutter/painting.dart' show HSLColor;

import '/@color/src/_all_src.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final class HueColorMixer extends ColorMixer {
  //
  //
  //

  const HueColorMixer({
    super.curve = ColorCurves.medium,
    super.baseColor,
    super.previousMixer,
    super.blender = const LerpColorBlender(),
  });

  //
  //
  //

  @override
  Color? getMix(int value) {
    assert(value >= 0 && value <= 1000);
    final mixedColor = this.blender.blend(baseColor, previousMixer?.getMix(value));
    final hslColor = HSLColor.fromColor(mixedColor);
    final t = value / 1000;
    final hue = hslColor.hue;
    final adjustedHue = (hue + 360 * super.getFirstCurve()!.transform(t)) % 360;
    return HSLColor.fromAHSL(
      mixedColor.alpha.toDouble() / 255.0,
      adjustedHue,
      hslColor.saturation,
      hslColor.lightness,
    ).toColor();
  }

  //
  //
  //

  @override
  HueColorMixer withChild(ColorMixer mixer) {
    return HueColorMixer(
      curve: this.curve,
      baseColor: this.baseColor,
      previousMixer: mixer,
      blender: this.blender,
    );
  }
}
