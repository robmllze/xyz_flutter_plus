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

class AppScale {
  //
  //
  //

  static final pDefaultAppScale = Pod<AppScale>(const AppScale());

  static SharedPreferences? sharedPreferences;

  //
  //
  //

  final double sc;

  //
  //
  //

  @visibleForTesting
  const AppScale([this.sc = 1.0]);

  //
  //
  //

  @visibleForTesting
  factory AppScale.determineFrom({
    required double scaleDivisor,
    required Size scaleSize,
  }) {
    final appScale =
        // Convert scale divisor to a scale factor...
        (1.0 / (scaleDivisor * 1000.0)) *
            // ...multiplied by the average of the screen width and height.
            0.5 *
            (scaleSize.width + scaleSize.height);
    return AppScale(appScale);
  }

  //
  //
  //

  @visibleForTesting
  factory AppScale.rescale(AppScale other, double sc) {
    return AppScale(other.sc * sc);
  }

  //
  //
  //

  static Future<AppScale?> getAppScaleFromCache() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final appScale = sharedPreferences.getDouble("app_scale");
    if (appScale != null) {
      return AppScale(appScale);
    }
    return null;
  }

  //
  //
  //

  static Future<bool> setAppScaleAndSaveToCache(
    double appScale, [
    Pod<AppScale>? pAppScale,
  ]) async {
    await (pAppScale ?? pDefaultAppScale).set(AppScale(appScale));
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setDouble("app_scale", appScale);
  }

  //
  //
  //

  static Future<void> updateAppScaleAndSaceToCache(
    double Function(double) update, [
    Pod<AppScale>? pAppScale,
  ]) async {
    final appScale = update(
      (pAppScale ?? pDefaultAppScale).value.sc,
    );
    await setAppScaleAndSaveToCache(appScale);
  }

  //
  //
  //

  static Future<void> resetAppScaleAndSaveToCache() async {
    await setAppScaleAndSaveToCache(1.0);
  }

  //
  //
  //

  static Future<void> setAppScaleFromCache([
    Pod<AppScale>? pAppScale,
  ]) async {
    final appScale = await getAppScaleFromCache() ?? const AppScale();
    await (pAppScale ?? pDefaultAppScale).set(appScale);
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension NumToScExtension on num {
  double get sc => this * AppScale.pDefaultAppScale.value.sc;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class Sc {
  final double _value;
  const Sc(this._value);
  static const zero = Sc(0.0);
  double get sc => this._value.sc;
}
