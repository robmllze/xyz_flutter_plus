//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:xyz_utils/html.dart';

import 'current_platform.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

AppLayout getPreferredAppLayout({
  required ScreenCalculator screenCalc,
  required bool isEmailVerified,
}) {
  if (CurrentPlatform.isMobile) {
    if (screenCalc.isVertical) {
      return AppLayout.MOBILE;
    }
    if (isEmailVerified) {
      return AppLayout.MOBILE_HORIZONTAL_LOGGED_IN;
    } else {
      return AppLayout.MOBILE_HORIZONTAL_LOGGED_OUT;
    }
  }
  if (screenCalc.isAspectRatioMobile && screenCalc.isVertical) {
    return AppLayout.NARROW;
  }
  return AppLayout.WIDE;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum AppLayout {
  WIDE,
  NARROW,
  MOBILE_HORIZONTAL_LOGGED_IN,
  MOBILE_HORIZONTAL_LOGGED_OUT,
  MOBILE,
}
