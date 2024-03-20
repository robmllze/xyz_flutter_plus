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

import "package:flutter/rendering.dart";

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// An abstract blender that takes two colors and provides a blend method.
abstract class ColorBlender {
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

    return _blend(c1!, c2!, b);
  }

  //
  //
  //

  Color _blend(
    Color c1,
    Color c2,
    double blendWeight,
  );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Performs a linear interpolation blend. Ideal for gradients and UI designs.
class LerpBlender extends ColorBlender {
  //
  //
  //

  const LerpBlender({
    super.color1,
    super.color2,
    super.blendWeight = 0.5,
  });

  //
  //
  //

  @override
  Color _blend(Color c1, Color c2, double blendWeight) {
    return Color.lerp(c1, c2, blendWeight)!;
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Blends colors based on the alpha value. Suitable for overlaps and fade effects.
class AlphaBlender extends ColorBlender {
  //
  //
  //

  const AlphaBlender({
    super.color1,
    super.color2,
    super.blendWeight = 0.5,
  });

  //
  //
  //

  @override
  Color _blend(Color c1, Color c2, double blendWeight) {
    if (c2.alpha == 0) return c1;
    if (c1.alpha == 0) return c2;

    // Calculate adjusted alpha for c2 based on blendWeight.
    final alphaAdjustment = 2.0 * (blendWeight - 0.5);
    final adjustedAlpha =
        (c2.alpha + alphaAdjustment * 255.0).clamp(0, 255).toInt();

    final alphaBlend = adjustedAlpha / 255.0;

    return Color.lerp(c1, c2, alphaBlend)!;
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Blends colors based on saturation. Aims to achieve balanced or unbalanced color mixes.
class SaturationBlender extends ColorBlender {
  //
  //
  //

  const SaturationBlender({
    super.color1,
    super.color2,
    super.blendWeight = 0.5,
  });

  //
  //
  //

  @override
  Color _blend(Color c1, Color c2, double blendWeight) {
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

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Blends based on brightness, useful for environments with specific lighting conditions.
class LightnessBlender extends ColorBlender {
  //
  //
  //

  const LightnessBlender({
    super.color1,
    super.color2,
    super.blendWeight = 0.5,
  });

  //
  //
  //

  @override
  Color _blend(Color c1, Color c2, double blendWeight) {
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

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Averages the RGB components of two colors for a straightforward blend.
class RGBAverageBlender extends ColorBlender {
  //
  //
  //

  const RGBAverageBlender({
    super.color1,
    super.color2,
    super.blendWeight = 0.5,
  });

  //
  //
  //

  @override
  Color _blend(Color c1, Color c2, double blendWeight) {
    int blendComponent(int component1, int component2) {
      return ((component1 * blendWeight) + (component2 * (1 - blendWeight)))
          .toInt();
    }

    return Color.fromARGB(
      blendComponent(c1.alpha, c2.alpha),
      blendComponent(c1.red, c2.red),
      blendComponent(c1.green, c2.green),
      blendComponent(c1.blue, c2.blue),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Averages the HSL components, focusing on human-centric color perception.
class HSLAverageBlender extends ColorBlender {
  //
  //
  //

  const HSLAverageBlender({
    super.color1,
    super.color2,
    super.blendWeight = 0.5,
  });

  //
  //
  //

  @override
  Color _blend(Color c1, Color c2, double blendWeight) {
    final hsl1 = HSLColor.fromColor(c1);
    final hsl2 = HSLColor.fromColor(c2);

    double blendComponent(double component1, double component2) {
      return (component1 * blendWeight) + (component2 * (1 - blendWeight));
    }

    final blendedHue = blendComponent(hsl1.hue, hsl2.hue);
    final blendedSaturation = blendComponent(hsl1.saturation, hsl2.saturation);
    final blendedLightness = blendComponent(hsl1.lightness, hsl2.lightness);
    final blendedAlpha = blendComponent(c1.alpha / 255, c2.alpha / 255);

    return HSLColor.fromAHSL(
      blendedAlpha,
      blendedHue,
      blendedSaturation,
      blendedLightness,
    ).toColor();
  }
}
