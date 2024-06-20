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

/// Averages the HSL components, focusing on human-centric color perception.
final class AverageHSLColorBlender extends ColorBlender {
  //
  //
  //

  const AverageHSLColorBlender({
    super.color1,
    super.color2,
    super.blendWeight = 0.5,
  });

  //
  //
  //

  @override
  Color $blend(Color c1, Color c2, double blendWeight) {
    final hsl1 = HSLColor.fromColor(c1);
    final hsl2 = HSLColor.fromColor(c2);

    double blendComponent(double component1, double component2) {
      return (component1 * blendWeight) + (component2 * (1 - blendWeight));
    }

    final blendedHue = blendComponent(hsl1.hue, hsl2.hue);
    final blendedSaturation = blendComponent(hsl1.saturation, hsl2.saturation);
    final blendedLightness = blendComponent(hsl1.lightness, hsl2.lightness);
    final blendedAlpha = blendComponent(c1.alpha / 255, c2.alpha / 255);

    return HSLColor.fromAHSL(
      blendedAlpha,
      blendedHue,
      blendedSaturation,
      blendedLightness,
    ).toColor();
  }
}
