//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// X|Y|Z & Dev
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/material.dart';

import 'w_column.dart';

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
  Widget build(_) {
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
