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

import 'package:flutter/material.dart';
import 'color_blenders.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ColorMixer {
  //
  //
  //

  final ParametricCurve<double>? curve;
  final Color? baseColor;
  final ColorMixer? previousMixer;
  final ColorBlender blender;

  //
  //
  //

  /// Retrieves the first curve in the mixer chain.
  ParametricCurve<double>? getFirstCurve() {
    return this.curve ?? previousMixer?.getFirstCurve();
  }

  /// Retrieves the first base color in the mixer chain.
  Color? getFirstBaseColor() {
    return this.baseColor ?? previousMixer?.getFirstBaseColor();
  }

  //
  //
  //

  const ColorMixer({
    this.curve = ColorCurves.medium,
    this.baseColor,
    this.previousMixer,
    this.blender = const LerpBlender(),
  });

  //
  //
  //

  ColorMixer withChild(ColorMixer mixer) {
    return ColorMixer(
      curve: this.curve,
      baseColor: this.baseColor,
      previousMixer: mixer,
      blender: this.blender,
    );
  }

  //
  //
  //

  Color? getMix(int value) {
    assert(value >= 0 && value <= 1000);
    if (baseColor != null) {
      return baseColor;
    }
    return previousMixer?.getMix(value);
  }

  Map<int, Color> getPallete() {
    final result = <int, Color>{
      50: this.getMix(50)!,
    };
    for (var n = 0; n <= 1000; n += 100) {
      result[n] = this.getMix(n)!;
    }
    return result;
  }

  MaterialColor getMaterialColor() {
    final pallete = this.getPallete();
    return MaterialColor(pallete[50]!.value, pallete);
  }

  //
  //
  //

  String getColorRangeDartCode(
    String baseName, [
    String prefix = "@override\nfinal ",
  ]) {
    final output = StringBuffer();
    output.writeln("// $baseName");

    void add(i) {
      final color = this.getMix(i)?.value.toRadixString(16).toUpperCase();
      //output.writeln("@override");
      output.writeln("$prefix$baseName$i = const Color(0x$color);");
    }

    add(0);
    add(50);
    for (var i = 100; i <= 1000; i += 100) {
      add(i);
    }
    return output.toString();
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ReverseMixer extends ColorMixer {
  const ReverseMixer({
    super.curve = ColorCurves.medium,
    super.baseColor,
    super.previousMixer,
    super.blender = const LerpBlender(),
  });

  @override
  Color? getMix(int value) {
    assert(value >= 0 && value <= 1000);
    final reversedValue = 1000 - value;
    return super.getMix(reversedValue);
  }

  @override
  ReverseMixer withChild(ColorMixer mixer) {
    return ReverseMixer(
      curve: this.curve,
      baseColor: this.baseColor,
      previousMixer: mixer,
      blender: this.blender,
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final class ColorCurves {
  static const Curve linear = Curves.linear;
  static const Curve medium = Cubic(0.25, 0.75, 0.75, 0.25);
  static const Curve slow = Cubic(0.3125, 0.9375, 0.9375, 0.3125); // -25%
  static const Curve fast = Cubic(0.1875, 0.5625, 0.5625, 0.1875); // +25%
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class BrightnessMixer extends ColorMixer {
  //
  //
  //

  const BrightnessMixer({
    super.curve = ColorCurves.medium,
    super.baseColor,
    super.previousMixer,
    super.blender = const LerpBlender(),
  });

  //
  //
  //

  @override
  Color? getMix(int value) {
    assert(value >= 0 && value <= 1000);
    final mixedColor =
        this.blender.blend(baseColor, previousMixer?.getMix(value));
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
  BrightnessMixer withChild(ColorMixer mixer) {
    return BrightnessMixer(
      curve: this.curve,
      baseColor: this.baseColor,
      previousMixer: mixer,
      blender: this.blender,
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class HueMixer extends ColorMixer {
  //
  //
  //

  const HueMixer({
    super.curve = ColorCurves.medium,
    super.baseColor,
    super.previousMixer,
    super.blender = const LerpBlender(),
  });

  //
  //
  //

  @override
  Color? getMix(int value) {
    assert(value >= 0 && value <= 1000);
    final mixedColor =
        this.blender.blend(baseColor, previousMixer?.getMix(value));
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
  HueMixer withChild(ColorMixer mixer) {
    return HueMixer(
      curve: this.curve,
      baseColor: this.baseColor,
      previousMixer: mixer,
      blender: this.blender,
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class SaturationMixer extends ColorMixer {
  //
  //
  //

  const SaturationMixer({
    super.curve = ColorCurves.medium,
    super.baseColor,
    super.previousMixer,
    super.blender = const LerpBlender(),
  });

  //
  //
  //

  @override
  Color? getMix(int value) {
    assert(value >= 0 && value <= 1000);
    final mixedColor =
        this.blender.blend(baseColor, previousMixer?.getMix(value));
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
  SaturationMixer withChild(ColorMixer mixer) {
    return SaturationMixer(
      curve: this.curve,
      baseColor: this.baseColor,
      previousMixer: mixer,
      blender: this.blender,
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class LightnessMixer extends ColorMixer {
  //
  //
  //

  const LightnessMixer({
    super.curve = ColorCurves.medium,
    super.baseColor,
    super.previousMixer,
    super.blender = const LerpBlender(),
  });

  //
  //
  //

  @override
  Color? getMix(int value) {
    assert(value >= 0 && value <= 1000);
    final mixedColor =
        this.blender.blend(baseColor, previousMixer?.getMix(value));
    final hslColor = HSLColor.fromColor(mixedColor);
    final t = value / 1000;
    final lightness = hslColor.lightness;
    var adjustedLightness = lightness * super.getFirstCurve()!.transform(t);
    adjustedLightness = adjustedLightness.clamp(0, 1).toDouble();
    return HSLColor.fromAHSL(
      mixedColor.alpha.toDouble() / 255.0,
      hslColor.hue,
      hslColor.saturation,
      adjustedLightness,
    ).toColor();
  }

  //
  //
  //

  @override
  LightnessMixer withChild(ColorMixer mixer) {
    return LightnessMixer(
      curve: this.curve,
      baseColor: this.baseColor,
      previousMixer: mixer,
      blender: this.blender,
    );
  }
}