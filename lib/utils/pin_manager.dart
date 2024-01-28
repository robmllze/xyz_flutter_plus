// //.title
// // ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
// //
// // XYZ Flutter Plus
// //
// // ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
// //.title~

// import 'dart:async';

// import 'secure_shared_preferences.dart';

// // ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// class PinManager {
//   //
//   //
//   //

//   final String appId;
//   final String protectedSharedPreferencesPassword;

//   //
//   //
//   //

//   PinManager({
//     required this.appId,
//     required this.protectedSharedPreferencesPassword,
//   });

//   //
//   //
//   //

//   late final _key = specificKey(key: "pin", appId: this.appId);
//   SecureSharedPreferences? _protectedSharedPreferences;
//   bool? _exists;

//   //
//   //
//   //

//   Future<bool> set(String pin) async {
//     this._protectedSharedPreferences ??= await SecureSharedPreferences.getInstance(
//       this.protectedSharedPreferencesPassword,
//     );
//     final ok = await this._protectedSharedPreferences!.setStringSalsa20(this._key, pin);
//     if (ok) this._exists = true;
//     return ok;
//   }

//   //
//   //
//   //

//   Future<String?> _get() async {
//     this._protectedSharedPreferences ??= await SecureSharedPreferences.getInstance(
//       this.protectedSharedPreferencesPassword,
//     );
//     final pin = this._protectedSharedPreferences!.getStringSalsa20(this._key);
//     this._exists = pin != null;
//     return pin;
//   }

//   //
//   //
//   //

//   Future<bool> confirm(String pin) async {
//     final pin0 = await this._get();
//     return pin0 == pin;
//   }

//   //
//   //
//   //

//   Future<void> remove() async {
//     this._protectedSharedPreferences ??= await SecureSharedPreferences.getInstance(
//       this.protectedSharedPreferencesPassword,
//     );
//     this._protectedSharedPreferences!.sharedPreferences.remove(this._key);
//     this._exists = false;
//   }

//   //
//   //
//   //

//   Future<bool> exists() async {
//     return this._exists ?? (await this._get() != null);
//   }
// }
