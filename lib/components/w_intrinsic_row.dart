//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/material.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// We can use the IntrinsicRow to draw a colored bar on the left side of some
/// Text:
/// ```dart
/// IntrinsicColumn(
///   children: [
///     Text("Hello World!"),
///     // The height of the Container will match the height of the Text.
///     Container(
///       // Bar thickness.
///       width: 2.0,
///       // Bar color.
///       color: Colors.red,
///     ),
///   ],
/// )
/// ```
class WIntrinsicRow extends StatelessWidget {
  final List<Widget> children;
  const WIntrinsicRow({super.key, this.children = const []});

  @override
  Widget build(_) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: this.children,
      ),
    );
  }
}
