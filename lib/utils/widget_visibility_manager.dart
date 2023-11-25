//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/widgets.dart' show Widget;
import 'package:xyz_pod/xyz_pod.dart' show Pod;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WidgetVisibilityManager {
  //
  //
  //
  //

  Widget originalWidget;

  late final Pod<Widget?> pCurrentWidget;

  WidgetVisibilityManager(this.originalWidget) {
    this.pCurrentWidget = Pod<Widget?>(this.originalWidget);
  }

  //
  //
  //

  bool get visible => this.pCurrentWidget.value != null;

  //
  //
  //

  Future<void> show([Widget? replacement]) async {
    if (replacement != null) {
      this.originalWidget = replacement;
    }
    await this.pCurrentWidget.set(this.originalWidget, delay: Duration.zero);
  }

  //
  //
  //

  Future<void> hide() async {
    await this.pCurrentWidget.set(null, delay: Duration.zero);
  }

  //
  //
  //

  Future<bool> toggle([Widget? replacement]) async {
    final visible = this.visible;
    if (visible) {
      await this.hide();
    } else {
      await this.show(replacement);
    }
    return visible;
  }
}
