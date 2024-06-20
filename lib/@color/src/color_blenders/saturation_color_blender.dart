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

/// Blends colors based on saturation. Aims to achieve balanced or unbalanced color mixes.
final class SaturationColorBlender extends ColorBlender {
  //
  //
  //

  const SaturationColorBlender({
    super.color1,
    super.color2,
    super.blendWeight = 0.5,
  });

  //
  //
  //

  @override
  Color $blend(Color c1, Color c2, double blendWeight) {
    final saturation1 = HSLColor.fromColor(c1).saturation;
    final saturation2 = HSLColor.fromColor(c2).saturation;
    var avgSaturation = (saturation1 + saturation2) / 2;

    // Adjust saturation based on blendWeight
    if (blendWeight > 0.5) {
      avgSaturation += (blendWeight - 0.5) * 2;
    } else {
      avgSaturation -= (0.5 - blendWeight) * 2;
    }
    avgSaturation = avgSaturation.clamp(0.0, 1.0);

    final hsl = HSLColor.fromColor(c1);
    return hsl.withSaturation(avgSaturation).toColor();
  }
}
