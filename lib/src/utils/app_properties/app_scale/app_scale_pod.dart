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

class AppScalePod extends AppPropertyPod<double> {
  //
  //
  //

  static AppScalePod? pDefault;
  static SharedPreferences? _sharedPreferences;

  //
  //
  //

  AppScalePod(super.value) : super(propertyKey: "app_scale") {
    pDefault = this;
  }

  //
  //
  //

  @override
  Future<void> setProperty(double? property) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    if (property != null) {
      await _sharedPreferences!.setDouble(this.propertyKey, property);
      await this.set(property);
    }
  }

  //
  //
  //

  @override
  Future<double?> getProperty() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    final property = _sharedPreferences!.getDouble(this.propertyKey);
    return property;
  }
}
