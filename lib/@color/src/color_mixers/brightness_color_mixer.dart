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

final class BrightnessColorMixer extends ColorMixer {
  //
  //
  //

  const BrightnessColorMixer({
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
    var t = value / 1000.0;
    t = super.getFirstCurve()!.transform(t);
    const white = Color(0xFFFFFFFF);
    const black = Color(0xFF000000);
    return t <= 0.5
        ? Color.lerp(white, mixedColor, t * 2)!
        : Color.lerp(mixedColor, black, (t - 0.5) * 2)!;
  }

  //
  //
  //

  @override
  BrightnessColorMixer withChild(ColorMixer mixer) {
    return BrightnessColorMixer(
      curve: this.curve,
      baseColor: this.baseColor,
      previousMixer: mixer,
      blender: this.blender,
    );
  }
}
