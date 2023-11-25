//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Usage Example:
///
/// ```dart
///
/// final _keyboardListener = WKeyboardListener(onShow: () {}, onHide: () {});
///
/// @override
/// void initState() {
///   super.initState();
///   this._keyboardListener.startListening();
/// }
///
/// @override
/// void dispose() {
///  this._keyboardListener.stopListening();
///  super.dispose();
/// }
///  ```
class KeyboardListener {
  //
  //
  //

  final FlutterView _view;
  final void Function()? onShow, onHide;
  Timer? _timer;
  bool _didCallOnShow = false, _didCallOnHide = false;

  //
  //
  //

  KeyboardListener({
    FlutterView? view,
    this.onShow,
    this.onHide,
  }) : this._view = view ?? PlatformDispatcher.instance.views.first;

  //
  //
  //

  /// NOTE:
  ///
  /// [startListening] must be called inside `initState`. Do NOT call it like this:
  ///
  /// ```dart
  /// final _keyboardListener = WKeyboardListener(onShow: () {}, onHide: () {})..startListening();
  /// ```
  void startListening() {
    this._timer = Timer.periodic(Duration.zero, (_) {
      if (this._view.viewInsets.bottom > 0.0) {
        if (this._didCallOnShow == false) {
          this.onShow?.call();
          this._didCallOnShow = true;
          this._didCallOnHide = false;
        }
      } else {
        if (this._didCallOnHide == false) {
          this.onHide?.call();
          this._didCallOnHide = true;
          this._didCallOnShow = false;
        }
      }
    });
  }

  //
  //
  //

  void stopListening() {
    this._timer?.cancel();
    this._timer = null;
  }
}
