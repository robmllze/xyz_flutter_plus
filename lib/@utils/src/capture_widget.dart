//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:async' show Completer;
import 'dart:ui' as ui show Image;

import 'package:flutter/rendering.dart' show RenderRepaintBoundary;
import 'package:flutter/widgets.dart';

import '/@painters/src/image_painter.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Captures a screenshot of the widget associated with the given [captureKey]
/// and returns a [CustomPaint] widget of the same displaying the captured image.
Future<CustomPaint> captureWidget(GlobalKey captureKey) async {
  final imageCompleter = Completer<ui.Image>();
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    final boundary =
        captureKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 1.0);
    imageCompleter.complete(image);
  });

  final image = await imageCompleter.future;
  final result = CustomPaint(
    painter: ImagePainter(image),
    size: Size(
      image.width.toDouble(),
      image.height.toDouble(),
    ),
  );
  return result;
}
