//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:crypto/crypto.dart' show sha256;
import 'dart:convert' show utf8;

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension ColorUtils on Color {
  Color get inverted {
    return Color.fromRGBO(
      255 - this.red,
      255 - this.green,
      255 - this.blue,
      this.opacity,
    );
  }

  Color withShadeCode(int shadeCode) {
    final hsl = HSLColor.fromColor(this);
    final lighter = hsl.withLightness((hsl.lightness + shadeCode / 900) % 1);
    return lighter.toColor();
  }

  Color withSaturation(double saturation) {
    final hsl = HSLColor.fromColor(this);
    return hsl.withSaturation(saturation).toColor();
  }

  Color lighten(double amount) {
    final hsl = HSLColor.fromColor(this);
    final changed = hsl.withLightness(hsl.lightness * amount);
    return changed.toColor();
  }

  Color darken(double amount) {
    final hsl = HSLColor.fromColor(this);
    final changed = hsl.withLightness(hsl.lightness * (1 - amount));
    return changed.toColor();
  }
}

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
  final baseColor = HSLColor.fromAHSL(1.0, hue.toDouble(), saturation, lightness).toColor();

  // Blend the base color with the blend color using the specified blend weight.
  final blendedColor = blendWeight > 0.0
      ? LerpBlender(
          color1: baseColor,
          color2: blendColor,
          blendWeight: blendWeight,
        ).blend()
      : baseColor;
  return blendedColor;
}
