//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/@theme/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension TextStyleExtension on TextStyle {
  //
  //
  //

  TextStyle get wInvertedColor {
    return this.copyWith(
      color: (this.color ?? const Color.fromARGB(255, 0, 0, 0)).inverted,
    );
  }

  TextStyle get wBlack => this.copyWith(fontWeight: FONT_WEIGHT_BLACK);
  TextStyle get wExtraBold => this.copyWith(fontWeight: FONT_WEIGHT_EXTRA_BOLD);
  TextStyle get wBold => this.copyWith(fontWeight: FONT_WEIGHT_BOLD);
  TextStyle get wSemiBold => this.copyWith(fontWeight: FONT_WEIGHT_SEMI_BOLD);
  TextStyle get wMedium => this.copyWith(fontWeight: FONT_WEIGHT_MEDIUM);
  TextStyle get wRegular => this.copyWith(fontWeight: FONT_WEIGHT_REGULAR);
  TextStyle get wLight => this.copyWith(fontWeight: FONT_WEIGHT_LIGHT);
  TextStyle get wExtraLight =>
      this.copyWith(fontWeight: FONT_WEIGHT_EXTRA_LIGHT);
  TextStyle get wThin => this.copyWith(fontWeight: FONT_WEIGHT_THIN);

  //
  //
  //

  TextStyle get wUnderlined =>
      this.copyWith(decoration: TextDecoration.underline);
  TextStyle get wOverlined =>
      this.copyWith(decoration: TextDecoration.overline);
  TextStyle get wLineThough =>
      this.copyWith(decoration: TextDecoration.lineThrough);
  TextStyle get wItalic => this.copyWith(fontStyle: FontStyle.italic);

  //
  //
  //

  TextStyle wWordSpacing(double wordSpacing) =>
      this.copyWith(wordSpacing: wordSpacing);
  TextStyle wLetterSpacing(double letterSpacing) =>
      this.copyWith(letterSpacing: letterSpacing);
}
