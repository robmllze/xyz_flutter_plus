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

import '/@color/src/_all_src.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Averages the RGB components of two colors for a straightforward blend.
final class AverageRGBColorBlender extends ColorBlender {
  //
  //
  //

  const AverageRGBColorBlender({
    super.color1,
    super.color2,
    super.blendWeight = 0.5,
  });

  //
  //
  //

  @override
  Color $blend(Color c1, Color c2, double blendWeight) {
    int blendComponent(int component1, int component2) {
      return ((component1 * blendWeight) + (component2 * (1 - blendWeight))).toInt();
    }

    return Color.fromARGB(
      blendComponent(c1.alpha, c2.alpha),
      blendComponent(c1.red, c2.red),
      blendComponent(c1.green, c2.green),
      blendComponent(c1.blue, c2.blue),
    );
  }
}
