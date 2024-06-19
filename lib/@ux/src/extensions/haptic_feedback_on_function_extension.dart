//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~


// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension HapticFeedbackOnFunctionExtension on Function {
  Function withLightImpact() {
    return () {
      HapticFeedback.lightImpact();
      this();
    };
  }

  Function withMediumImpact() {
    return () {
      HapticFeedback.mediumImpact();
      this();
    };
  }

  Function withHeavyImpact() {
    return () {
      HapticFeedback.heavyImpact();
      this();
    };
  }

  Function withVibrate() {
    return () {
      HapticFeedback.vibrate();
      this();
    };
  }

  Function selectionClick() {
    return () {
      HapticFeedback.selectionClick();
      this();
    };
  }
}
