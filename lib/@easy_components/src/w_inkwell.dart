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

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WInkWell extends StatelessWidget {
  //
  //
  //

  final ShapeBorder? customBorder;
  final void Function()? onTap;
  final void Function()? onTapDown;
  final BorderRadius? borderRadius;
  final bool? selected;
  final Widget? child;

  //
  //
  //

  const WInkWell({
    super.key,
    this.customBorder,
    this.onTap,
    this.onTapDown,
    this.borderRadius,
    this.selected,
    this.child,
  });

  //
  //

  //

  @override
  Widget build(BuildContext context) {
    final $borderRadius = borderRadius ?? BorderRadius.circular(8.sc);
    final $selectedBorder = customBorder ?? RoundedRectangleBorder(borderRadius: $borderRadius);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: selected == null
            ? customBorder
            : selected!
                ? $selectedBorder
                : customBorder,
        borderRadius: $borderRadius,
        onTap: this.onTap,
        onTapDown: this.onTapDown != null ? (_) => onTapDown!() : null,
        child: this.child != null
            ? ClipRRect(
                borderRadius: $borderRadius,
                child: child,
              )
            : null,
      ),
    );
  }
}
