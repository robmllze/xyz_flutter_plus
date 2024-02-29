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

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WSearchBarWithActionsLayout extends StatelessWidget {
  //
  //
  //

  final double minSearchFieldWidth;
  final Widget searchField;
  final double spacing;
  final List<(Widget, double)> actionsAndTheirWidths;

  //
  //
  //

  const WSearchBarWithActionsLayout({
    super.key,
    this.minSearchFieldWidth = 200.0,
    this.spacing = 8.0,
    required this.searchField,
    required this.actionsAndTheirWidths,
  });

  //
  //
  //

  @override
  Widget build(_) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final maxWidth = constraints.maxWidth;
        final widths = actionsAndTheirWidths.map((e) => e.$2);
        final widthSum = widths.reduce((a, b) => a + b);
        var searchBarWith = maxWidth - widthSum - widths.length * spacing;
        if (searchBarWith < minSearchFieldWidth) {
          searchBarWith = double.infinity;
        }
        return Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: spacing,
          runSpacing: spacing,
          alignment: WrapAlignment.end,
          children: [
            SizedBox(
              width: searchBarWith,
              child: searchField,
            ),
            ...actionsAndTheirWidths
                .map((e) => SizedBox(width: e.$2, child: e.$1)),
          ],
        );
      },
    );
  }
}
