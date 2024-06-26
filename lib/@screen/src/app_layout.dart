//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/widgets.dart';
import 'package:xyz_utils/xyz_utils.dart';

import '/@utils/src/current_platform.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum AppLayout {
  //
  //
  //

  WIDE,
  NARROW,
  MOBILE_HORIZONTAL,
  MOBILE;

  //
  //
  //

  static AppLayout currentScreenLayout() {
    final currentScreenCalculator = getCurrentScreenCalculator();
    final currentScreenLayout = fromScreenCalculator(currentScreenCalculator);
    return currentScreenLayout;
  }

  //
  //
  //

  static AppLayout fromScreenCalculator(ScreenCalculator calculator) {
    if (CurrentPlatform.isMobile) {
      if (calculator.isVertical) {
        return AppLayout.MOBILE;
      } else {
        return AppLayout.MOBILE_HORIZONTAL;
      }
    }
    if (calculator.isAspectRatioMobile && calculator.isVertical) {
      return AppLayout.NARROW;
    }
    return AppLayout.WIDE;
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

ScreenCalculator getCurrentScreenCalculator() {
  final firstDisplay =
      WidgetsBinding.instance.platformDispatcher.displays.first;
  final displaySize = firstDisplay.size;
  final displayPixelRatio = firstDisplay.devicePixelRatio;
  final screenSize = displaySize / displayPixelRatio;
  return ScreenCalculator(
    screenSize.width,
    screenSize.height,
  );
}
