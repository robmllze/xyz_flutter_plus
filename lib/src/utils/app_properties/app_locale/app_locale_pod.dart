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

import 'package:flutter/services.dart' show rootBundle;

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class AppLocalePod extends AppPropertyPod<AppLocaleEnumMixin> {
  //
  //
  //

  static AppLocalePod? pDefault;
  static SharedPreferences? _sharedPreferences;

  static final _fileReader = TranslationFileReader(
    fileReader: (filePath) => rootBundle.loadString(filePath),
  );

  //
  //
  //

  final List<AppLocaleEnumMixin> values;

  //
  //
  //

  AppLocalePod(
    super.value, {
    required this.values,
  }) : super(propertyKey: "app_locale") {
    pDefault = this;
  }

  //
  //
  //

  @override
  Future<void> setProperty(AppLocaleEnumMixin? property) async {
    if (property != null) {
      await _fileReader.read(property);
      _sharedPreferences ??= await SharedPreferences.getInstance();
      await _sharedPreferences!.setString(
        this.propertyKey,
        property.localeCode,
      );
      await this.set(property);
    }
  }

  //
  //
  //

  @override
  Future<AppLocaleEnumMixin?> getProperty() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    final string = _sharedPreferences!.getString(this.propertyKey);
    if (string != null) {
      final property = this.values.valueOf(string);
      if (property != null) {
        await _fileReader.read(property);
        await this.set(property);
        return property;
      }
    }
    return null;
  }
}
