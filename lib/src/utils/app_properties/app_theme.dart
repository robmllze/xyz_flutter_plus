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

class AppThemePod<T extends AppThemeEnumMixin> extends AppPropertyPod<T> {
  //
  //
  //

  static AppThemePod get pDefault {
    assert(_pDefault != null, 'AppThemePod.pDefault is null');
    return _pDefault!;
  }

  static AppThemePod? _pDefault;

  //
  //
  //

  AppThemePod({required super.values}) {
    _pDefault = this;
  }

  //
  //
  //

  @override
  Future<void> setProperty(T property) async {
    await super.setProperty(property);
    await this.set(property);
  }

  //
  //
  //

  @override
  Future<T?> getProperty() async {
    final property = await super.getProperty();
    await this.set(property);
    return property;
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// A mixin for an enum that represents a theme.
mixin AppThemeEnumMixin implements Enum {
  ThemeData get themeData;
}
