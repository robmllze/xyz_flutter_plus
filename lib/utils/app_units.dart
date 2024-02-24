//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final pAppUnits = Pod<AppUnits>(const AppUnits());

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class AppUnits {
  //
  //
  //

  static SharedPreferences? sharedPreferences;

  static AppUnits? currentUnits;

  //
  //
  //

  final double appScale;

  //
  //
  //

  const AppUnits([this.appScale = 1.0]);

  //
  //
  //

  factory AppUnits.determineFrom({
    required double scaleDivisor,
    required Size scaleSize,
  }) {
    final appScale =
        // Convert scale divisor to a scale factor...
        (1.0 / (scaleDivisor * 1000.0)) *
            // ...multiplied by the average of the screen width and height.
            0.5 *
            (scaleSize.width + scaleSize.height);
    return AppUnits(appScale);
  }

  //
  //
  //

  factory AppUnits.scale(AppUnits other, double scale) {
    final appScale = other.appScale * scale;
    return AppUnits(appScale);
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension Sc on num {
  double get sc => this * pAppUnits.value.appScale;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class AppUnit {
  final double _value;
  const AppUnit(this._value);
  static const zero = AppUnit(0.0);
  double get sc => Sc(this._value).sc;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<AppUnits?> getAppUnitsFromDeviceStorage() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final appScale = sharedPreferences.getDouble("app_scale");
  if (appScale != null) {
    return AppUnits(appScale);
  }
  return null;
}

Future<bool> setAppScaleToDeviceStorage(double appScale) async {
  await pAppUnits.set(AppUnits(appScale));
  final sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.setDouble("app_scale", appScale);
}

Future<void> updateAppScaleToDeviceStorage(
  double Function(double) update,
) async {
  final updatedAppScale = update(pAppUnits.value.appScale);
  await setAppScaleToDeviceStorage(updatedAppScale);
}

Future<void> resetappScale() => setAppScaleToDeviceStorage(1.0);

Future<void> loadAppUnitsFromDeviceStorage() async {
  final loadedAppUnits =
      await getAppUnitsFromDeviceStorage() ?? const AppUnits();
  await pAppUnits.set(loadedAppUnits);
}
