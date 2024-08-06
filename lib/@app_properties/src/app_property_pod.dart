//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:df_pod/df_pod.dart';
import 'package:df_type/df_type.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract class AppPropertyPod<T extends Enum> extends Pod<T?> {
  //
  //
  //

  static SharedPreferences? _sharedPreferences;

  //
  //
  //

  final List<T> values;

  //
  //
  //

  AppPropertyPod({
    required this.values,
  }) : super(values.firstOrNull);

  //
  //
  //

  @mustBeOverridden
  @mustCallSuper
  Future<void> setProperty(T property) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    await _sharedPreferences!.setString(this.propertyKey, property.name);
  }

  //
  //
  //

  @mustBeOverridden
  @mustCallSuper
  Future<T?> getProperty() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    final raw = _sharedPreferences!.getString(this.propertyKey);
    if (raw != null) {
      final property = this.values.valueOf(raw);
      if (property != null) {
        return property;
      }
    }
    return this.value;
  }

  //
  //
  //

  String get propertyKey => T.toString();
}
