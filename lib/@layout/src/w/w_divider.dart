//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:math' as math;

import 'package:flutter/material.dart';

import '/@app_properties/src/_all_src.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WDivider extends StatelessWidget {
  //
  //
  //

  final double? thickness;
  final Color? color;
  final double? size;
  final Axis? orientation;
  final bool? overflow;
  final double? childMainAxisPadding;
  final WDividerAlignment? childAlignment;
  final BoxDecoration? childDecoration;
  final Widget? child;

  //
  //
  //

  const WDivider({
    super.key,
    this.thickness,
    this.color,
    this.size,
    this.orientation,
    this.overflow,
    this.childMainAxisPadding,
    this.childAlignment,
    this.childDecoration,
    this.child,
  });

  //
  //
  //

  factory WDivider.horizontal({
    Key? key,
    double? thickness,
    Color? color,
    double? size,
    bool? overflow,
    Widget? child,
    double? childMainAxisPadding,
    WDividerAlignment? childAlignment,
    BoxDecoration? childDecoration,
  }) {
    return WDivider(
      key: key,
      thickness: thickness,
      color: color,
      size: size,
      orientation: Axis.horizontal,
      overflow: overflow,
      childMainAxisPadding: childMainAxisPadding,
      childAlignment: childAlignment,
      childDecoration: childDecoration,
      child: child,
    );
  }

  //
  //
  //

  factory WDivider.vertical({
    Key? key,
    double? thickness,
    Color? color,
    double? size,
    bool? overflow,
    Widget? child,
    double? childMainAxisPadding,
    WDividerAlignment? childAlignment,
    BoxDecoration? childDecoration,
  }) {
    return WDivider(
      key: key,
      thickness: thickness,
      color: color,
      size: size,
      orientation: Axis.vertical,
      overflow: overflow,
      childMainAxisPadding: childMainAxisPadding,
      childAlignment: childAlignment,
      childDecoration: childDecoration,
      child: child,
    );
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final $orientation = orientation ?? Axis.horizontal;
    final $thickness = thickness ?? 1.sc;
    final $color = color ?? Theme.of(context).colorScheme.surfaceContainer;
    final $size = math.max($thickness, size ?? $thickness);
    final $spacing = childMainAxisPadding ?? 8.sc;
    final $childAlignment = childAlignment?.toAlignment($orientation) ?? Alignment.center;
    final vertical = $orientation == Axis.vertical;
    final horizontal = $orientation == Axis.horizontal;
    final screenSize = MediaQuery.of(context).size;
    final container = horizontal
        ? Container(
            width: double.infinity,
            height: $thickness,
            color: $color,
          )
        : Container(
            width: $thickness,
            height: double.infinity,
            color: $color,
          );
    final $overflow = overflow ?? false;
    final stack = Stack(
      alignment: Alignment.center,
      children: [
        container,
        if (child != null)
          Align(
            alignment: $childAlignment,
            child: IntrinsicHeight(
              child: IntrinsicWidth(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: vertical ? $spacing : 0.0,
                    horizontal: horizontal ? $spacing : 0.0,
                  ),
                  child: Container(
                    height: horizontal ? $size : null,
                    width: vertical ? $size : null,
                    decoration: (this.childDecoration ?? const BoxDecoration()).copyWith(
                      color: this.childDecoration?.color ?? Theme.of(context).colorScheme.surface,
                      borderRadius: this.childDecoration?.borderRadius ??
                          BorderRadius.circular(math.max(8.sc, 0.25 * $size)),
                    ),
                    alignment: Alignment.center,
                    child: child!,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
    final line = $overflow
        ? OverflowBox(
            maxWidth: horizontal ? screenSize.width : null,
            maxHeight: vertical ? screenSize.height : null,
            child: stack,
          )
        : stack;
    final result = SizedBox(
      width: vertical ? $size : null,
      height: horizontal ? $size : null,
      child: line,
    );
    return result;
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum WDividerAlignment {
  //
  //
  //

  START,
  CENTER,
  END;

  //
  //
  //

  Alignment toAlignment(Axis axis) {
    switch (this) {
      case WDividerAlignment.START:
        return axis == Axis.horizontal ? Alignment.centerLeft : Alignment.topCenter;
      case WDividerAlignment.CENTER:
        return Alignment.center;
      case WDividerAlignment.END:
        return axis == Axis.horizontal ? Alignment.centerRight : Alignment.bottomCenter;
    }
  }
}
