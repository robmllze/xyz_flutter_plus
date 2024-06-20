//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:xyz_pod/xyz_pod.dart';
import 'package:xyz_utils/xyz_utils.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class InternetConnectionChecker {
  //
  //
  //

  static final pingUrl = Uri.parse('https://httpstat.us/200');
  static const kTimeOutDuration = Duration(seconds: 5);
  static const kDebounceDelay = Duration(seconds: 3);

  //
  //
  //

  final pHasInternet = Pod<bool>(true);

  late final StreamSubscription<List<ConnectivityResult>> _stream;
  late final _debouncer = Debouncer(
    delay: kDebounceDelay,
    onWaited: this._checkInternet,
  );

  Future<void> _checkInternet() async {
    this.pHasInternet.set(await this.hasInternet());
  }

  Future<bool> hasInternet() {
    return Future.any([
      Future.delayed(kTimeOutDuration, () => false),
      http
          .get(pingUrl)
          .then((final response) => response.statusCode == 200)
          .catchError((_) => false),
    ]);
  }

  //
  //
  //

  InternetConnectionChecker({
    void Function()? onInternetConnectionRestored,
    void Function()? onInternetConnectionLost,
  }) {
    this._stream = Connectivity().onConnectivityChanged.listen((_) => this._debouncer());
    () async {
      await this.hasInternet();
      this.pHasInternet.addListener(() async {
        (this.pHasInternet.value ? onInternetConnectionRestored : onInternetConnectionLost)?.call();
      });
    }();
  }

  //
  //
  //

  void dispose() {
    this._stream.cancel();
    this.pHasInternet.dispose();
  }
}
