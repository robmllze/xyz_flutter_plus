//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform, kIsWeb;
import 'package:flutter/widgets.dart' show MediaQueryData, WidgetsBinding;

import 'package:device_info_plus/device_info_plus.dart' as device_info_plus;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class CurrentPlatform {
  //
  //
  //

  final _deviceInfoPlugin = device_info_plus.DeviceInfoPlugin();
  String _name = 'UNKNOWN';
  String get name => this._name;

  //
  //
  //

  CurrentPlatform._();

  //
  //
  //

  static Future<CurrentPlatform> create() async {
    final instance = CurrentPlatform._();
    instance._name = await instance.getName();
    return instance;
  }

  //
  //
  //

  bool supportsPushNotifications() {
    if (kIsWeb) {
      return [
        'SAFARI ON MACOS',
        'SAFARI ON IOS',
        'CHROME ON MACOS',
        'CHROME ON WINDOWS',
        'CHROME ON ANDROID',
      ].contains(this.name);
    }
    return true;
  }

  //
  //
  //

  /// NOTE: Only supports Android, iOS, MacOS, Windows, Web.
  Future<String> getName() async {
    if (kIsWeb) {
      final info = await this._deviceInfoPlugin.webBrowserInfo;
      final browserName = info.browserName.name.toUpperCase();
      if (isOsMacOs) {
        return '$browserName ON MACOS';
      }
      if (isOsWindows) {
        return '$browserName ON WINDOWS';
      }
      if (isOsIos) {
        return '$browserName ON IOS';
      }
      if (isOsAndroid) {
        return '$browserName ON ANDROID';
      }
    } else {
      if (isOsAndroid) {
        final info = await this._deviceInfoPlugin.androidInfo;
        return info.model;
      }
      if (isOsIos) {
        final info = await this._deviceInfoPlugin.iosInfo;
        return info.model;
      }
    }
    return 'UNKNOWN';
  }

  static final isOsIos = defaultTargetPlatform == TargetPlatform.iOS;
  static final isOsAndroid = defaultTargetPlatform == TargetPlatform.android;
  static final isOsMobile = isOsIos || isOsAndroid;
  static final isOsWindows = defaultTargetPlatform == TargetPlatform.windows;
  static final isOsMacOs = defaultTargetPlatform == TargetPlatform.macOS;
  static final isOsLinux = defaultTargetPlatform == TargetPlatform.linux;
  static final isOsApple = isOsIos || isOsMacOs;
  static final isOsDeskop = isOsWindows || isOsMacOs || isOsLinux;
  static bool get isTablet => isOsMobile && isWindowSizeTabletOrDesktop;
  static bool get isMobile => isOsMobile && isWindowSizeMobile;
  static bool get isDesktop => isOsWindows || isOsMacOs || isOsLinux;

  static bool get isWindowSizeMobile {
    final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
    final data = MediaQueryData.fromView(firstView);
    return data.size.shortestSide < 550.0;
  }

  static bool get isWindowSizeTabletOrDesktop => !isWindowSizeMobile;
}
