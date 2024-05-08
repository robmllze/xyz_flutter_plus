//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/material.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WColumn extends StatelessWidget {
  //
  //
  //

  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final Widget? divider;
  final List<Widget> children;

  //
  //
  //

  const WColumn({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.divider,
    this.children = const <Widget>[],
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final dividedChildren = <Widget>[];
    if (children.isNotEmpty) {
      if (children.length != 1) {
        final length = children.length;
        for (var n = 0; n < length - 1; n++) {
          dividedChildren.add(children[n]);
          if (divider != null) {
            dividedChildren.add(divider!);
          }
        }
        dividedChildren.add(children.last);
      } else {
        dividedChildren.add(children.first);
      }
    }

    return Column(
      mainAxisAlignment: this.mainAxisAlignment,
      mainAxisSize: this.mainAxisSize,
      crossAxisAlignment: this.crossAxisAlignment,
      textDirection: this.textDirection,
      verticalDirection: this.verticalDirection,
      textBaseline: this.textBaseline,
      children: dividedChildren,
    );
  }
}
