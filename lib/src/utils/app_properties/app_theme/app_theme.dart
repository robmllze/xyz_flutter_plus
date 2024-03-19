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

class AppThemePod extends AppPropertyPod<AppThemeEnumMixin> {
  //
  //
  //

  static AppThemePod? pDefault;
  static SharedPreferences? _sharedPreferences;
  //
  //
  //

  final List<AppThemeEnumMixin> values;

  //
  //
  //

  AppThemePod(
    super.value, {
    required this.values,
  }) : super(propertyKey: "app_theme") {
    pDefault = this;
  }

  //
  //
  //

  @override
  Future<void> setProperty(AppThemeEnumMixin? property) async {
    if (property != null) {
      _sharedPreferences ??= await SharedPreferences.getInstance();
      await _sharedPreferences!.setString(
        super.propertyKey,
        property.name,
      );
      await this.set(property);
    }
  }

  //
  //
  //

  @override
  Future<AppThemeEnumMixin?> getProperty() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    final string = _sharedPreferences!.getString(super.propertyKey);
    if (string != null) {
      final property = this.values.valueOf(string);
      if (property != null) {
        await this.set(property);
        return property;
      }
    }
    return null;
  }
}
