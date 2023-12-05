//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show Widget;

import 'package:xyz_pod/xyz_pod.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WidgetVisibilityManager<T extends Widget> {
  //
  //
  //
  //

  T? originalWidget;

  late final Pod<T?> pCurrentWidget;

  WidgetVisibilityManager([this.originalWidget]) {
    this.pCurrentWidget = Pod<T?>(this.originalWidget);
  }

  //
  //
  //

  bool get visible => this.pCurrentWidget.value != null;

  //
  //
  //

  Future<void> show([T? replacement]) async {
    if (replacement != null) {
      this.originalWidget = replacement;
    }
    await this.pCurrentWidget.set(this.originalWidget);
  }

  //
  //
  //

  Future<void> hide() async {
    await this.pCurrentWidget.set(null);
  }

  //
  //
  //

  Future<bool> toggle([T? replacement]) async {
    final visible = this.visible;
    if (visible) {
      await this.hide();
    } else {
      await this.show(replacement);
    }
    return visible;
  }
}
