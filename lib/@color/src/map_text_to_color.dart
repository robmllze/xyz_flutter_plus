//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:convert' show utf8;
import 'dart:ui' show Color;

import 'package:crypto/crypto.dart' show sha256;
import 'package:flutter/rendering.dart' show HSLColor;

import '/@color/src/_all_src.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Color mapTextToColor(
  String text, {
  double saturation = 0.35,
  double lightness = 0.7,
  Color blendColor = const Color(0xFFFFFFFF),
  double blendWeight = 0.0,
}) {
  // Generate a hash value from the name.
  final bytes = utf8.encode(text);
  final hash = sha256.convert(bytes);
  final hashString = hash.toString();

  // Convert the first 8 characters of the hash to an integer.
  final hashInteger = int.parse(hashString.substring(0, 8), radix: 16);

  // Map the hash integer to a hue value between 0 and 359.
  final hue = hashInteger % 360;

  // Create a color with the desired saturation, lightness, and alpha values.
  final baseColor =
      HSLColor.fromAHSL(1.0, hue.toDouble(), saturation, lightness).toColor();

  // Blend the base color with the blend color using the specified blend weight.
  final blendedColor = blendWeight > 0.0
      ? LerpColorBlender(
          color1: baseColor,
          color2: blendColor,
          blendWeight: blendWeight,
        ).blend()
      : baseColor;
  return blendedColor;
}
