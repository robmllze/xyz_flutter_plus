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

import '/@layout/src/_all_src.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WMainLayout extends StatelessWidget {
  //
  //
  //

  final Widget? header;
  final Widget? footer;
  final Widget? top, body, bottom;

  //
  //
  //

  const WMainLayout({
    super.key,
    this.header,
    this.footer,
    this.top,
    this.body,
    this.bottom,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return WColumn(
      children: [
        const SizedBox(width: double.infinity),
        if (this.top != null) this.top!,
        if (this.header != null) this.header!,
        if (this.body != null)
          Flexible(
            fit: FlexFit.tight,
            child: SizedBox(
              child: body,
            ),
          ),
        SizedBox(child: this.footer),
        SizedBox(child: this.bottom),
      ],
    );
  }
}
