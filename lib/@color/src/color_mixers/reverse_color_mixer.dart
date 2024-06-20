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

final class ReverseColorMixer extends ColorMixer {
  const ReverseColorMixer({
    super.curve = ColorCurves.medium,
    super.baseColor,
    super.previousMixer,
    super.blender = const LerpColorBlender(),
  });

  @override
  Color? getMix(int value) {
    assert(value >= 0 && value <= 1000);
    final reversedValue = 1000 - value;
    return super.getMix(reversedValue);
  }

  @override
  ReverseColorMixer withChild(ColorMixer mixer) {
    return ReverseColorMixer(
      curve: this.curve,
      baseColor: this.baseColor,
      previousMixer: mixer,
      blender: this.blender,
    );
  }
}
