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

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract class AppPropertyPod<T extends Enum> extends Pod<T> {
  //
  //
  //

  static SharedPreferences? _sharedPreferences;

  //
  //
  //

  final List<T> values;

  //
  //
  //

  AppPropertyPod({
    required this.values,
  }) : super(values.first);

  //
  //
  //

  @mustBeOverridden
  @mustCallSuper
  Future<void> setProperty(T property) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    await _sharedPreferences!.setString(this.propertyKey, property.name);
  }

  //
  //
  //

  @mustBeOverridden
  @mustCallSuper
  Future<T> getProperty() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    final raw = _sharedPreferences!.getString(this.propertyKey);
    if (raw != null) {
      final property = this.values.valueOf(raw);
      if (property != null) {
        return property;
      }
    }
    return this.value;
  }

  //
  //
  //

  String get propertyKey => T.hashCode.toString();
}
