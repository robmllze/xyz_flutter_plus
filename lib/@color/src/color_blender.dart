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

import 'package:meta/meta.dart' show protected;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract base class ColorBlender {
  //
  //
  //

  final Color? color1;
  final Color? color2;
  final double? blendWeight;

  //
  //
  //

  const ColorBlender({
    this.color1,
    this.color2,
    this.blendWeight,
  });

  //
  //
  //

  Color blend([Color? color1, Color? color2, double? blendWeight]) {
    final t1 = (color1 ?? this.color1);
    final t2 = (color2 ?? this.color2);
    assert(t1 != null || t2 != null);
    final b = blendWeight ?? this.blendWeight ?? 0.5;
    assert(b >= 0 && b <= 1);
    final c1 = (t1 ?? t2);
    final c2 = (t2 ?? t1);
    return $blend(c1!, c2!, b);
  }

  //
  //
  //

  @protected
  Color $blend(
    Color c1,
    Color c2,
    double blendWeight,
  );
}
