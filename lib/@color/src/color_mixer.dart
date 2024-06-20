//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/material.dart';

import '/@color/src/_all_src.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

base class ColorMixer {
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
    this.blender = const LerpColorBlender(),
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
    String prefix = '@override\nfinal ',
  ]) {
    final output = StringBuffer();
    output.writeln('// $baseName');

    void add(i) {
      final color = this.getMix(i)?.value.toRadixString(16).toUpperCase();
      //output.writeln('@override');
      output.writeln('$prefix$baseName$i = const Color(0x$color);');
    }

    add(0);
    add(50);
    for (var i = 100; i <= 1000; i += 100) {
      add(i);
    }
    return output.toString();
  }
}
