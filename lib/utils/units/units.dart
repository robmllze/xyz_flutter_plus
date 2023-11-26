//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:xyz_pod/xyz_pod.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class Units {
  //
  //
  //

  static final pUnits = Pod<Units>(Units());

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
      await Units.pUnits.set(Units());
    }
  }

  //
  //
  //

  static SharedPreferences? sharedPreferences;
  static Units? currentUnits;

  late final double uiScale;

  //
  //
  //

  Units([this.uiScale = 1.0]) {
    this._recalculate();
  }

  //
  //
  //

  Units.determineFrom({
    required double scaleDivisor,
    required Size scaleSize,
  }) {
    this.uiScale =
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
    this.uiScale = other.uiScale * scale;
    this._recalculate();
  }

  //
  //
  //

  late double _$1,
      _$2,
      _$4,
      _$8,
      _$12,
      _$16,
      _$20,
      _$24,
      _$28,
      _$32,
      _$36,
      _$40,
      _$44,
      _$48,
      _$52,
      _$56,
      _$60,
      _$64,
      _$68,
      _$72,
      _$76,
      _$80,
      _$84,
      _$88,
      _$92,
      _$96,
      _$100,
      _$104,
      _$108,
      _$112,
      _$116,
      _$120,
      _$124,
      _$128,
      _$132,
      _$136,
      _$140,
      _$144,
      _$148,
      _$152,
      _$156,
      _$160,
      _$164,
      _$168,
      _$172,
      _$176,
      _$180,
      _$184,
      _$188,
      _$192,
      _$196,
      _$200,
      _$300,
      _$400;

  //
  //
  //

  void _recalculate() {
    this._$1 = 1.0 * this.uiScale;
    this._$2 = 2.0 * this.uiScale;
    this._$4 = 4.0 * this.uiScale;
    this._$8 = 8.0 * this.uiScale;
    this._$12 = 12.0 * this.uiScale;
    this._$16 = 16.0 * this.uiScale;
    this._$20 = 20.0 * this.uiScale;
    this._$24 = 24.0 * this.uiScale;
    this._$28 = 28.0 * this.uiScale;
    this._$32 = 32.0 * this.uiScale;
    this._$36 = 36.0 * this.uiScale;
    this._$40 = 40.0 * this.uiScale;
    this._$44 = 44.0 * this.uiScale;
    this._$48 = 48.0 * this.uiScale;
    this._$52 = 52.0 * this.uiScale;
    this._$56 = 56.0 * this.uiScale;
    this._$60 = 60.0 * this.uiScale;
    this._$64 = 64.0 * this.uiScale;
    this._$68 = 68.0 * this.uiScale;
    this._$72 = 72.0 * this.uiScale;
    this._$76 = 76.0 * this.uiScale;
    this._$80 = 80.0 * this.uiScale;
    this._$84 = 84.0 * this.uiScale;
    this._$88 = 88.0 * this.uiScale;
    this._$92 = 92.0 * this.uiScale;
    this._$96 = 96.0 * this.uiScale;
    this._$100 = 100.0 * this.uiScale;
    this._$104 = 104.0 * this.uiScale;
    this._$108 = 108.0 * this.uiScale;
    this._$112 = 112.0 * this.uiScale;
    this._$116 = 116.0 * this.uiScale;
    this._$120 = 120.0 * this.uiScale;
    this._$124 = 124.0 * this.uiScale;
    this._$128 = 128.0 * this.uiScale;
    this._$132 = 132.0 * this.uiScale;
    this._$136 = 136.0 * this.uiScale;
    this._$140 = 140.0 * this.uiScale;
    this._$144 = 144.0 * this.uiScale;
    this._$148 = 148.0 * this.uiScale;
    this._$152 = 152.0 * this.uiScale;
    this._$156 = 156.0 * this.uiScale;
    this._$160 = 160.0 * this.uiScale;
    this._$164 = 164.0 * this.uiScale;
    this._$168 = 168.0 * this.uiScale;
    this._$172 = 172.0 * this.uiScale;
    this._$176 = 176.0 * this.uiScale;
    this._$180 = 180.0 * this.uiScale;
    this._$184 = 184.0 * this.uiScale;
    this._$188 = 188.0 * this.uiScale;
    this._$192 = 192.0 * this.uiScale;
    this._$196 = 196.0 * this.uiScale;
    this._$200 = 200.0 * this.uiScale;
    this._$300 = 300.0 * this.uiScale;
    this._$400 = 400.0 * this.uiScale;
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension DoubleDotScaled on double {
  double get scaled => this * Units.pUnits.value.uiScale;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class Unit {
  final double _value;
  const Unit(this._value);
  static const zero = Unit(0.0);
  double get auto => DoubleDotScaled(this._value).scaled;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

double get $1 => Units.value._$1;
double get $2 => Units.value._$2;
double get $4 => Units.value._$4;
double get $8 => Units.value._$8;
double get $12 => Units.value._$12;
double get $16 => Units.value._$16;
double get $20 => Units.value._$20;
double get $24 => Units.value._$24;
double get $28 => Units.value._$28;
double get $32 => Units.value._$32;
double get $36 => Units.value._$36;
double get $40 => Units.value._$40;
double get $44 => Units.value._$44;
double get $48 => Units.value._$48;
double get $52 => Units.value._$52;
double get $56 => Units.value._$56;
double get $60 => Units.value._$60;
double get $64 => Units.value._$64;
double get $68 => Units.value._$68;
double get $72 => Units.value._$72;
double get $76 => Units.value._$76;
double get $80 => Units.value._$80;
double get $84 => Units.value._$84;
double get $88 => Units.value._$88;
double get $92 => Units.value._$92;
double get $96 => Units.value._$96;
double get $100 => Units.value._$100;
double get $104 => Units.value._$104;
double get $108 => Units.value._$108;
double get $112 => Units.value._$112;
double get $116 => Units.value._$116;
double get $120 => Units.value._$120;
double get $124 => Units.value._$124;
double get $128 => Units.value._$128;
double get $132 => Units.value._$132;
double get $136 => Units.value._$136;
double get $140 => Units.value._$140;
double get $144 => Units.value._$144;
double get $148 => Units.value._$148;
double get $152 => Units.value._$152;
double get $156 => Units.value._$156;
double get $160 => Units.value._$160;
double get $164 => Units.value._$164;
double get $168 => Units.value._$168;
double get $172 => Units.value._$172;
double get $176 => Units.value._$176;
double get $180 => Units.value._$180;
double get $184 => Units.value._$184;
double get $188 => Units.value._$188;
double get $192 => Units.value._$192;
double get $196 => Units.value._$196;
double get $200 => Units.value._$200;
double get $300 => Units.value._$300;
double get $400 => Units.value._$400;

double get $smallIcon => $16;
double get $mediumIcon => $20;
double get $largeIcon => $24;
