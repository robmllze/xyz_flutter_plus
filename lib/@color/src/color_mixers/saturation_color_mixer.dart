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

final class SaturationColorMixer extends ColorMixer {
  //
  //
  //

  const SaturationColorMixer({
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
    final saturation = hslColor.saturation;
    var adjustedSaturation = saturation * super.getFirstCurve()!.transform(t);
    adjustedSaturation = adjustedSaturation.clamp(0, 1).toDouble();
    return HSLColor.fromAHSL(
      mixedColor.alpha.toDouble() / 255.0,
      hslColor.hue,
      adjustedSaturation,
      hslColor.lightness,
    ).toColor();
  }

  //
  //
  //

  @override
  SaturationColorMixer withChild(ColorMixer mixer) {
    return SaturationColorMixer(
      curve: this.curve,
      baseColor: this.baseColor,
      previousMixer: mixer,
      blender: this.blender,
    );
  }
}
