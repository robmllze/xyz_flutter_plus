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

class AppScalePod<T extends AppScaleEnumMixin> extends AppPropertyPod<T> {
  //
  //
  //

  static AppScalePod get pDefault {
    assert(_pDefault != null, 'AppScalePod.pDefault is null');
    return _pDefault!;
  }

  static AppScalePod? _pDefault;

  //
  //
  //

  AppScalePod({required super.values}) {
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

/// A mixin for an enum that represents a scale.
mixin AppScaleEnumMixin implements Enum {
  double get scale;
}

extension NumToScExtension on num {
  double get sc => this * (AppScalePod._pDefault?.value?.scale ?? 1.0);
}

class Sc {
  final double _value;
  const Sc(this._value);
  static const zero = Sc(0.0);
  double get sc => this._value.sc;
}
