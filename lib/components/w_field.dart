//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:xyz_pod/xyz_pod.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract class WField extends StatefulWidget {
  //
  //
  //

  final Pod pValue;
  final Pod<String>? pTitle;
  final Pod<bool>? pShowTitleDot;
  final Pod<bool>? pEnabled;
  final Pod<bool>? pObscured;
  final Pod<bool>? pReadOnly;
  final Pod<String?>? pErrorText;

  //
  //
  //

  const WField({
    super.key,
    required this.pValue,
    this.pTitle,
    this.pShowTitleDot,
    this.pEnabled,
    this.pObscured,
    this.pReadOnly,
    this.pErrorText,
  });

  //
  //
  //

  @override
  WFieldState createState();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract class WFieldState<T extends WField> extends State<T> {
  //
  //
  //

  late final pEnabled = this.widget.pEnabled;
  late final pErrorText = this.widget.pErrorText;
  late final pObscured = this.widget.pObscured;
  late final pReadOnly = this.widget.pReadOnly;
  late final pShowTitleDot = this.widget.pShowTitleDot;
  late final pTitle = this.widget.pTitle;
  late final pValue = this.widget.pValue;

  //
  //
  //

  @override
  void initState() {
    this._addListeners();
    super.initState();
  }

  //
  //
  //

  void _addListeners() {
    this._removeListenerEnabled = this.pEnabled?.addListener((final state) {
      this.onChangedEnabled(state.value);
    });
    this._removeListenerErrorText = this.pErrorText?.addListener((final state) {
      this.onChangedErrorText(state.value);
    });
    this._removeListenerObscured = this.pObscured?.addListener((final state) {
      this.onChangedObscured(state.value);
    });
    this._removeListenerReadOnly = this.pReadOnly?.addListener((final state) {
      this.onChangedReadOnly(state.value);
    });
    this._removeListenerShowTitleDot = this.pShowTitleDot?.addListener((final state) {
      this.onChangedShowTitleDot(state.value);
    });

    this._removeListenerTitle = this.pTitle?.addListener((final state) {
      this.onChangedTitle(state.value);
    });
    this._removeListenerValue = this.pValue.addListener((final state) {
      this.onChangedValue(state.value);
    });
  }

  //
  //
  //

  late final void Function()? _removeListenerEnabled;
  late final void Function()? _removeListenerErrorText;
  late final void Function()? _removeListenerObscured;
  late final void Function()? _removeListenerReadOnly;
  late final void Function()? _removeListenerShowTitleDot;
  late final void Function()? _removeListenerTitle;
  late final void Function()? _removeListenerValue;

  //
  //
  //

  @visibleForOverriding
  void onChangedEnabled(bool value) {}

  @visibleForOverriding
  void onChangedErrorText(String? value) {}

  @visibleForOverriding
  void onChangedObscured(bool value) {}

  @visibleForOverriding
  void onChangedReadOnly(bool value) {}

  @visibleForOverriding
  void onChangedShowTitleDot(bool value) {}

  @visibleForOverriding
  void onChangedTitle(String value) {}

  @visibleForOverriding
  void onChangedValue(dynamic value) {}

  //
  //
  //

  @override
  void dispose() {
    this._removeListenerEnabled?.call();
    this._removeListenerErrorText?.call();
    this._removeListenerObscured?.call();
    this._removeListenerReadOnly?.call();
    this._removeListenerShowTitleDot?.call();
    this._removeListenerTitle?.call();
    this._removeListenerValue?.call();
    this.pEnabled?.disposeIfRequested();
    this.pErrorText?.disposeIfRequested();
    this.pObscured?.disposeIfRequested();
    this.pReadOnly?.disposeIfRequested();
    this.pShowTitleDot?.disposeIfRequested();
    this.pTitle?.disposeIfRequested();
    this.pValue.disposeIfRequested();
    super.dispose();
  }
}
