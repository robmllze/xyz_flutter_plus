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

class AppLocalePod<T extends AppLocaleEnumMixin> extends AppPropertyPod<T> {
  //
  //
  //

  static AppLocalePod? pDefault;
  static final _fileReader = TranslationFileReader(
    fileReader: (filePath) => rootBundle.loadString(filePath),
  );

  //
  //
  //

  AppLocalePod({
    required super.values,
  }) {
    pDefault = this;
  }

  //
  //
  //

  @override
  Future<void> setProperty(T property) async {
    await _fileReader.read(property);
    await super.setProperty(property);
    await this.set(property);
  }

  //
  //
  //

  @override
  Future<T?> getProperty() async {
    final property = await super.getProperty();
    if (property != null) {
      await _fileReader.read(property);
      await this.set(property);
    }
    return property;
  }
}
