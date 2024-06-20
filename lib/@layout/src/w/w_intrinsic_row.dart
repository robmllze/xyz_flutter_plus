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

import '/@layout/src/w/w_flex.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// We can use the IntrinsicRow to draw a colored bar on the left side of some
/// text:
///
/// ```dart
/// WIntrinsicColumn(
///   children: [
///     Text('Hello World!'),
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
  //
  //
  //

  final Widget? firstIfNotEmpty;
  final Widget? divider;
  final Widget? lastIfNotEmpty;
  final List<Widget?>? children;

  //
  //
  //

  const WIntrinsicRow({
    super.key,
    this.firstIfNotEmpty,
    this.divider,
    this.lastIfNotEmpty,
    this.children,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: WFlex.row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        firstIfNotEmpty: this.firstIfNotEmpty,
        divider: this.divider,
        lastIfNotEmpty: this.lastIfNotEmpty,
        children: this.children,
      ),
    );
  }
}
