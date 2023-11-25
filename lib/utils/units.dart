//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/rendering.dart';
import 'package:xyz_utils/html.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class Units {
  //
  //
  //

  //static double _determinedFactor = 1.0;

  static SharedPreferences? sharedPreferences;
  static Units? currentUnits;

  late final double factor;

  //
  //
  //

  Units([this.factor = 1.0]) {
    this._recalculate();
  }

  //
  //
  //

  Units.determineFrom({
    required double scaleDivisor,
    required Size scaleSize,
  }) {
    this.factor =
        // Convert scale divisor to a scale factor...
        (1.0 / (scaleDivisor * 1000.0)) *
            // ...multiplied by the average of the screen width and height.
            0.5 *
            (scaleSize.width + scaleSize.height);
    //_determinedFactor = this.factor;
    this._recalculate();
  }

  //
  //
  //

  Units.scale(Units other, double scale) {
    this.factor = other.factor * scale;
    this._recalculate();
  }

  //
  //
  //

  late double $1,
      $2,
      $4,
      $8,
      $12,
      $16,
      $20,
      $24,
      $28,
      $32,
      $36,
      $40,
      $44,
      $48,
      $52,
      $56,
      $60,
      $64,
      $68,
      $72,
      $76,
      $80,
      $84,
      $88,
      $92,
      $96,
      $100,
      $104,
      $108,
      $112,
      $116,
      $120,
      $124,
      $128,
      $132,
      $136,
      $140,
      $144,
      $148,
      $152,
      $156,
      $160,
      $164,
      $168,
      $172,
      $176,
      $180,
      $184,
      $188,
      $192,
      $196,
      $200;

  //
  //
  //

  void _recalculate() {
    this.$1 = 1.0 * this.factor;
    this.$2 = 2.0 * this.factor;
    this.$4 = 4.0 * this.factor;
    this.$8 = 8.0 * this.factor;
    this.$12 = 12.0 * this.factor;
    this.$16 = 16.0 * this.factor;
    this.$20 = 20.0 * this.factor;
    this.$24 = 24.0 * this.factor;
    this.$28 = 28.0 * this.factor;
    this.$32 = 32.0 * this.factor;
    this.$36 = 36.0 * this.factor;
    this.$40 = 40.0 * this.factor;
    this.$44 = 44.0 * this.factor;
    this.$48 = 48.0 * this.factor;
    this.$52 = 52.0 * this.factor;
    this.$56 = 56.0 * this.factor;
    this.$60 = 60.0 * this.factor;
    this.$64 = 64.0 * this.factor;
    this.$68 = 68.0 * this.factor;
    this.$72 = 72.0 * this.factor;
    this.$76 = 76.0 * this.factor;
    this.$80 = 80.0 * this.factor;
    this.$84 = 84.0 * this.factor;
    this.$88 = 88.0 * this.factor;
    this.$92 = 92.0 * this.factor;
    this.$96 = 96.0 * this.factor;
    this.$100 = 100.0 * this.factor;
    this.$104 = 104.0 * this.factor;
    this.$108 = 108.0 * this.factor;
    this.$112 = 112.0 * this.factor;
    this.$116 = 116.0 * this.factor;
    this.$120 = 120.0 * this.factor;
    this.$124 = 124.0 * this.factor;
    this.$128 = 128.0 * this.factor;
    this.$132 = 132.0 * this.factor;
    this.$136 = 136.0 * this.factor;
    this.$140 = 140.0 * this.factor;
    this.$144 = 144.0 * this.factor;
    this.$148 = 148.0 * this.factor;
    this.$152 = 152.0 * this.factor;
    this.$156 = 156.0 * this.factor;
    this.$160 = 160.0 * this.factor;
    this.$164 = 164.0 * this.factor;
    this.$168 = 168.0 * this.factor;
    this.$172 = 172.0 * this.factor;
    this.$176 = 176.0 * this.factor;
    this.$180 = 180.0 * this.factor;
    this.$184 = 184.0 * this.factor;
    this.$188 = 188.0 * this.factor;
    this.$192 = 192.0 * this.factor;
    this.$196 = 196.0 * this.factor;
    this.$200 = 200.0 * this.factor;
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Units? getUnitsFromSharedPreferences(
  SharedPreferences sharedPreferences,
) {
  final uiScale = sharedPreferences.getDouble("ui_scale");
  if (uiScale != null) {
    return Units(uiScale);
  }
  return null;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<bool> saveUIScaleToSharedPreferences(
  SharedPreferences sharedPreferences,
  double uiScale,
) {
  return sharedPreferences.setDouble("ui_scale", uiScale);
}
