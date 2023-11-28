//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Shared
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WTextFieldEvent {
  //
  //
  //

  final WTextFieldMakeup? makeup;
  final WFieldState? state;
  final String? text;
  final bool? hasFocus;
  final bool showTitleDot;
  final bool hasError;
  final bool enabled;
  final bool readOnly;
  final bool obscured;
  final String? hint;
  final String? error;
  final List<String> autoFillHints;

  //
  //
  //

  WTextFieldEvent({
    this.makeup,
    this.state,
    this.text,
    this.hasFocus,
    this.showTitleDot = false,
    this.hasError = false,
    this.enabled = true,
    this.readOnly = false,
    this.obscured = false,
    this.hint,
    this.error,
    this.autoFillHints = const [],
  });

  //
  //
  //

  WTextFieldEvent copyWith({
    WTextFieldMakeup? makeup,
    WTextField? widget,
    WFieldState? state,
    String? text,
    bool? hasFocus,
    bool? showTitleDot,
    bool? hasError,
    bool? enabled,
    bool? readOnly,
    bool? obscured,
    String? hint,
    String? error,
    List<String>? autoFillHints,
  }) {
    return WTextFieldEvent(
      makeup: makeup ?? this.makeup,
      state: state ?? this.state,
      text: text ?? this.text,
      hasFocus: hasFocus ?? this.hasFocus,
      showTitleDot: showTitleDot ?? this.showTitleDot,
      hasError: hasError ?? this.hasError,
      enabled: enabled ?? this.enabled,
      readOnly: readOnly ?? this.readOnly,
      obscured: obscured ?? this.obscured,
      hint: hint ?? this.hint,
      error: error ?? this.error,
      autoFillHints: autoFillHints ?? this.autoFillHints,
    );
  }
}
