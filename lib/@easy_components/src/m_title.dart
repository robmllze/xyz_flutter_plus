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

import '/@app_properties/src/_all_src.g.dart';
import '/@layout/src/w/w_column.dart';
import '/@theme/src/_all_src.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MTitle extends StatelessWidget {
  //
  //
  //

  final String? titleText;
  final Widget? title;
  final TextStyleFromTheme? style;
  final Widget? child;
  final double? spacing;

  //
  //
  //

  const MTitle({
    super.key,
    this.titleText,
    this.title,
    this.style,
    this.spacing,
    this.child,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final hasTitleText = this.titleText?.isNotEmpty == true;
    final hasTitleWidget = this.title != null;
    final hatTitle = hasTitleText || hasTitleWidget;
    return WColumn(
      divider: SizedBox(height: this.spacing ?? 8.sc),
      children: [
        if (hatTitle) ...[
          DefaultTextStyle(
            style: this.style?.of(context) ??
                Theme.of(context).textTheme.labelMedium?.wSemiBold ??
                const TextStyle(),
            child: hasTitleText
                ? Text(
                    this.titleText!,
                  )
                : this.title!,
          ),
        ],
        if (this.child != null) this.child!,
      ],
    );
  }
}
