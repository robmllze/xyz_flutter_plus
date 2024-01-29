//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class Units {
  //
  //
  //

  static SharedPreferences? sharedPreferences;

  static Units? currentUnits;

  static final pUnits = Pod<Units>(const Units());

  static Units get value => pUnits.value;

  static Future<Units?> getUnitsFromSharedPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final uiScale = sharedPreferences.getDouble("ui_scale");
    if (uiScale != null) {
      return Units(uiScale);
    }
    return null;
  }

  static Future<bool> saveUIScaleToSharedPreferences(double uiScale) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setDouble("ui_scale", uiScale);
  }

  static Future<void> updateUIScale(double Function(double) update) async {
    final a = Units.value.uiScale;
    final b = update(a);
    if (await saveUIScaleToSharedPreferences(b)) {
      await Units.pUnits.set(Units(b));
    }
  }

  static Future<void> resetUIScale() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (await sharedPreferences.remove("ui_scale")) {
      await Units.pUnits.set(const Units());
    }
  }

  //
  //
  //

  final double uiScale;

  //
  //
  //

  const Units([this.uiScale = 1.0]);

  //
  //
  //

  factory Units.determineFrom({
    required double scaleDivisor,
    required Size scaleSize,
  }) {
    final uiScale =
        // Convert scale divisor to a scale factor...
        (1.0 / (scaleDivisor * 1000.0)) *
            // ...multiplied by the average of the screen width and height.
            0.5 *
            (scaleSize.width + scaleSize.height);
    return Units(uiScale);
  }

  //
  //
  //

  factory Units.scale(Units other, double scale) {
    final uiScale = other.uiScale * scale;
    return Units(uiScale);
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Widget unitsScope(Widget child) {
  return ValueListenableBuilder(
    valueListenable: Units.pUnits,
    builder: (_, __, ___) => child,
  );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension DoubleDotScaled on num {
  double get sc => this * Units.pUnits.value.uiScale;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class Unit {
  final double _value;
  const Unit(this._value);
  static const zero = Unit(0.0);
  num get auto => DoubleDotScaled(this._value).sc;
}
