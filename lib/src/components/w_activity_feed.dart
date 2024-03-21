//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/material.dart';

import 'w_circle.dart';
import 'scalable/w_inline_text.dart';
import 'w_intrinsic_row.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WActivityFeedEntry extends StatelessWidget {
  //
  //
  //

  final EdgeInsets padding;
  final String? date;
  final TextStyle? dateStyle;
  final EdgeInsets datePadding;
  final String? title;
  final TextStyle? titleStyle;
  final EdgeInsets titlePadding;
  final String? body;
  final TextStyle? bodyStyle;
  final EdgeInsets bodyPadding;
  final Map<String, TextStyle> namedStyles;
  final Map<String, Widget> namedWidgets;
  final Map<String, VoidCallback> namedCallbacks;

  //
  //
  //

  const WActivityFeedEntry({
    super.key,
    this.padding = const EdgeInsets.only(left: 12.0, bottom: 32.0),
    this.title,
    this.titleStyle =
        const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
    this.titlePadding = const EdgeInsets.only(bottom: 12.0),
    this.body,
    this.bodyStyle = const TextStyle(fontSize: 12.0),
    this.bodyPadding = const EdgeInsets.only(bottom: 8.0),
    this.date,
    this.dateStyle = const TextStyle(fontSize: 10.0, color: Colors.grey),
    this.datePadding = const EdgeInsets.all(0.0),
    this.namedStyles = const {},
    this.namedWidgets = const {},
    this.namedCallbacks = const {},
  });

  //
  //
  //

  @override
  Widget build(_) {
    return Padding(
      padding: this.padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (this.title != null)
            Padding(
              padding: this.titlePadding,
              child: WInlineText(
                this.title!,
                style: this.titleStyle,
                textAlign: TextAlign.left,
                softWrap: true,
                namedStyles: this.namedStyles,
                namedWidgets: this.namedWidgets,
                namedCallbacks: this.namedCallbacks,
              ),
            ),
          if (this.body != null)
            Padding(
              padding: this.bodyPadding,
              child: WInlineText(
                this.body!,
                style: this.bodyStyle,
                textAlign: TextAlign.left,
                softWrap: true,
                namedStyles: this.namedStyles,
                namedWidgets: this.namedWidgets,
                namedCallbacks: this.namedCallbacks,
              ),
            ),
          if (this.date != null)
            Padding(
              padding: this.datePadding,
              child: WInlineText(
                this.date!,
                style: this.dateStyle,
                textAlign: TextAlign.left,
                softWrap: true,
                namedStyles: this.namedStyles,
                namedWidgets: this.namedWidgets,
                namedCallbacks: this.namedCallbacks,
              ),
            ),
        ],
      ),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WActivityFeed extends StatelessWidget {
  //
  //
  //

  final Color color;
  final List<Widget> children;
  final EdgeInsets childrenPadding;
  final double lineWidth;
  final double markerRadius;

  //
  //
  //

  const WActivityFeed({
    super.key,
    this.color = Colors.black,
    this.children = const [],
    this.childrenPadding = const EdgeInsets.only(left: 8.0, bottom: 8.0),
    this.lineWidth = 2.0,
    this.markerRadius = 5.0,
  });

  //
  //
  //

  WActivityFeed copyWith({
    Color? color,
    List<Widget>? children,
    EdgeInsets? childrenPadding,
    double? lineWidth,
    double? markerRadius,
  }) {
    return WActivityFeed(
      key: key,
      color: color ?? this.color,
      childrenPadding: childrenPadding ?? this.childrenPadding,
      lineWidth: lineWidth ?? this.lineWidth,
      markerRadius: markerRadius ?? this.markerRadius,
      children: children ?? this.children,
    );
  }

  //
  //
  //

  @override
  Widget build(_) {
    List<Widget>? a;
    Widget? b;
    if (children.isEmpty) {
      return const SizedBox();
    } else if (children.length == 1) {
      b = children.first;
    } else if (children.length > 1) {
      a = children.sublist(0, children.length - 1);
      b = children.last;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (a != null)
          ...a.map(
            (final child) => WIntrinsicRow(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Circle(
                      radius: this.markerRadius,
                      color: this.color,
                    ),
                    Expanded(
                      child: Container(
                        color: this.color,
                        width: this.lineWidth,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: this.childrenPadding,
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Circle(
              radius: this.markerRadius,
              color: this.color,
            ),
            Expanded(
              child: Padding(
                padding: this.childrenPadding,
                child: b!,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
