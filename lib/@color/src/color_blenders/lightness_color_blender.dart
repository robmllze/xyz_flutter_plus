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

/// Blends based on brightness, useful for environments with specific lighting conditions.
final class LightnessColorBlender extends ColorBlender {
  //
  //
  //

  const LightnessColorBlender({
    super.color1,
    super.color2,
    super.blendWeight = 0.5,
  });

  //
  //
  //

  @override
  Color $blend(Color c1, Color c2, double blendWeight) {
    final brightness1 = HSLColor.fromColor(c1).lightness;
    final brightness2 = HSLColor.fromColor(c2).lightness;
    var avgBrightness = (brightness1 + brightness2) / 2;

    // Adjust brightness based on blendWeight
    if (blendWeight > 0.5) {
      avgBrightness += (blendWeight - 0.5) * 2;
    } else {
      avgBrightness -= (0.5 - blendWeight) * 2;
    }
    avgBrightness = avgBrightness.clamp(0.0, 1.0);

    final hsl = HSLColor.fromColor(c1);
    return hsl.withLightness(avgBrightness).toColor();
  }
}