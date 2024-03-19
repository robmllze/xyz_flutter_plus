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

  static AppLocalePod get pDefault => _pDefault;
  static late AppLocalePod _pDefault;

  //
  //
  //

  final TranslationFileReader? fileReader;

  //
  //
  //

  AppLocalePod({
    required super.values,
    required this.fileReader,
  }) {
    _pDefault = this;
  }

  //
  //
  //

  @override
  Future<void> setProperty(T property) async {
    await property._read();
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
      await property._read();
      await this.set(property);
    }
    return property;
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

mixin AppLocaleEnumMixin implements Enum {
  /// The locale code, such as "en_US".
  String get localeCode;

  /// The reference to this locale.
  LocaleRef get localeRef => LocaleRef.fromCode(localeCode);

  /// The description of this locale.
  String get localeDescription => "Locales.descriptions.${this.name}||${this.name}".tr();

  /// The translation file reader for this locale.
  TranslationFileReader get translationFileReader {
    return TranslationFileReader(
      translationsDirPath: ["assets", "translations"],
      fileReader: (filePath) => rootBundle.loadString(filePath),
    );
  }

  Future<FileConfig> _read() {
    return this.translationFileReader.read(this.localeCode);
  }
}
