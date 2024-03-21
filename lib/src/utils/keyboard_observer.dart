//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
//
// Licensing details can be found in the LICENSE file in the root directory.
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
/// final _keyboardObserver = KeyboardObserver(onShow: () {}, onHide: () {});
///
/// @override
/// void initState() {
///   super.initState();
///   this._keyboardObserver.startObserving();
/// }
///
/// @override
/// void dispose() {
///  this._keyboardObserver.stopObserving();
///  super.dispose();
/// }
///  ```
class KeyboardObserver {
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

  KeyboardObserver({
    FlutterView? view,
    this.onShow,
    this.onHide,
  }) : this._view = view ?? PlatformDispatcher.instance.views.first;

  //
  //
  //

  /// NOTE:
  ///
  /// [startObserving] must be called inside `initState`. Do NOT call it like this:
  ///
  /// ```dart
  /// final _keyboardObserver = KeyboardObserver(onShow: () {}, onHide: () {})..stopObserving();
  /// ```
  void startObserving() {
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

  void stopObserving() {
    this._timer?.cancel();
    this._timer = null;
  }
}
