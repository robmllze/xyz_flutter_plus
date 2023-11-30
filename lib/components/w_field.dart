//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import '../utils/pod/pod.dart';

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
    this._removeListenerEnabled = this.pEnabled != null //
        ? () => this.onChangedEnabled(this.pEnabled!.value)
        : null;
    this.pEnabled?.addListener(this._removeListenerEnabled!);
    this._removeListenerErrorText = this.pErrorText != null //
        ? () => this.onChangedErrorText(this.pErrorText!.value)
        : null;

    this.pErrorText?.addListener(this._removeListenerErrorText!);
    this._removeListenerObscured = this.pObscured != null //
        ? () => this.onChangedObscured(this.pObscured!.value)
        : null;

    this.pObscured?.addListener(this._removeListenerObscured!);
    this._removeListenerReadOnly = this.pReadOnly != null //
        ? () => this.onChangedReadOnly(this.pReadOnly!.value)
        : null;

    this.pReadOnly?.addListener(this._removeListenerReadOnly!);
    this._removeListenerShowTitleDot = this.pShowTitleDot != null //
        ? () => this.onChangedShowTitleDot(this.pShowTitleDot!.value)
        : null;

    this.pShowTitleDot?.addListener(this._removeListenerShowTitleDot!);
    this._removeListenerTitle = this.pTitle != null //
        ? () => this.onChangedTitle(this.pTitle!.value)
        : null;

    this.pTitle?.addListener(this._removeListenerTitle!);
    this._removeListenerValue = this._removeListenerValue != null //
        ? () => this.onChangedValue(this.pValue.value)
        : null;
    this.pValue.addListener(this._removeListenerValue!);
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
    this.pEnabled?.disposeIfTemp();
    this.pErrorText?.disposeIfTemp();
    this.pObscured?.disposeIfTemp();
    this.pReadOnly?.disposeIfTemp();
    this.pShowTitleDot?.disposeIfTemp();
    this.pTitle?.disposeIfTemp();
    this.pValue.disposeIfTemp();
    super.dispose();
  }
}
