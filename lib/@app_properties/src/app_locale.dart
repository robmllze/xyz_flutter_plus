//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/services.dart';
import 'package:df_config/df_config.dart';

import 'app_property_pod.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class AppLocalePod<T extends AppLocaleEnumMixin> extends AppPropertyPod<T> {
  //
  //
  //

  static AppLocalePod? get pDefault => _pDefault;
  static AppLocalePod? _pDefault;

  //
  //
  //

  AppLocalePod({required super.values}) {
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
    await property?._read();
    await this.set(property);
    return property;
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

mixin AppLocaleEnumMixin implements Enum {
  /// The locale code, such as 'en_US'.
  String get localeCode;

  /// The reference to this locale.
  LocaleRef get localeRef => LocaleRef.fromCode(localeCode);

  /// The translation file reader for this locale.
  TranslationFileReader get translationFileReader {
    return TranslationFileReader(
      translationsDirPath: ['assets', 'translations'],
      fileReader: (filePath) => rootBundle.loadString(filePath),
    );
  }

  Future<FileConfig> _read() {
    return this.translationFileReader.read(this.localeCode);
  }
}
