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

import "dart:ui" show Color;

import "/src/utils/color/color_blenders.dart";

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract class CommonPalette {
  const CommonPalette();

  // Primary colors: Highlight the main interactive elements in the UI.
  Color get primary => primary500;
  Color get primary50;
  Color get primary100;
  Color get primary200;
  Color get primary300;
  Color get primary400;
  Color get primary500;
  Color get primary600;
  Color get primary700;
  Color get primary800;
  Color get primary900;

  // Secondary colors: Supplement the primary colors and indicate secondary focus.
  Color get secondary => secondary500;
  Color get secondary50;
  Color get secondary100;
  Color get secondary200;
  Color get secondary300;
  Color get secondary400;
  Color get secondary500;
  Color get secondary600;
  Color get secondary700;
  Color get secondary800;
  Color get secondary900;

  // Success colors: Represent positive outcomes or successful operations.
  Color get success => success500;
  Color get success50;
  Color get success100;
  Color get success200;
  Color get success300;
  Color get success400;
  Color get success500;
  Color get success600;
  Color get success700;
  Color get success800;
  Color get success900;

  // Neutral colors: Provide a range of grayscale shades for use in various UI elements.
  Color get neutral => neutral500;
  Color get neutral50;
  Color get neutral100;
  Color get neutral200;
  Color get neutral300;
  Color get neutral400;
  Color get neutral500;
  Color get neutral600;
  Color get neutral700;
  Color get neutral800;
  Color get neutral900;

  // Warning colors: Indicate potential issues or cautionary states.
  Color get warning => warning500;
  Color get warning50;
  Color get warning100;
  Color get warning200;
  Color get warning300;
  Color get warning400;
  Color get warning500;
  Color get warning600;
  Color get warning700;
  Color get warning800;
  Color get warning900;

  // Error colors: Highlight errors or negative outcomes.
  Color get error => error500;
  Color get error50;
  Color get error100;
  Color get error200;
  Color get error300;
  Color get error400;
  Color get error500;
  Color get error600;
  Color get error700;
  Color get error800;
  Color get error900;

  // Contrast colors: Used for backgrounds and foregrounds to create contrast.
  Color get contrast => this.contrast900;
  Color get contrast0;
  Color get contrast50 => this.neutral50;
  Color get contrast100 => this.neutral100;
  Color get contrast200 => this.neutral200;
  Color get contrast300 => this.neutral300;
  Color get contrast400 => this.neutral400;
  Color get contrast500 => this.neutral500;
  Color get contrast600 => this.neutral600;
  Color get contrast700 => this.neutral700;
  Color get contrast800 => this.neutral800;
  Color get contrast900 => this.neutral900;
  Color get contrast1000;

  Color get light => this.neutral50;
  Color get disabled => this.neutral200;
  Color get medium => this.neutral400;
  Color get heavy => this.neutral900;

  Color get background => this.contrast50;
  Color get foreground => this.contrast1000;
  Color get shadow => const Color(0xff000000).withOpacity(0.1);
  Color get overlay => contrast1000.withOpacity(0.25);

  Color get apple => const Color(0xff000000);
  Color get facebook => const Color(0xff1877f2);
  Color get google => const Color(0xffdd4b39);

  Color get dividerColor {
    return LerpBlender(
      color1: this.background,
      color2: this.foreground,
      blendWeight: 0.1,
    ).blend();
  }
}
