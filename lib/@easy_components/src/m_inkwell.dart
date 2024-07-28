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

class MInkWell extends StatelessWidget {
  //
  //
  //

  final ShapeBorder? customBorder;
  final void Function()? onTap;
  final void Function()? onTapDown;
  final BorderRadius? borderRadius;
  final Widget? child;
  final Size? size;
  final Color? color;

  //
  //
  //

  const MInkWell({
    super.key,
    this.customBorder,
    this.onTap,
    this.onTapDown,
    this.borderRadius,
    this.child,
    this.size,
    this.color,
  });

  //
  //
  //

  factory MInkWell.iconButton({
    Key? key,
    ShapeBorder? customBorder,
    void Function()? onTap,
    void Function()? onTapDown,
    Widget? icon,
    double? diameter,
    Color? color,
  }) {
    final diameter1 = diameter ?? 48.sc;
    final radius1 = 0.5 * diameter1;
    return MInkWell(
      key: key,
      customBorder: customBorder,
      onTap: onTap,
      onTapDown: onTapDown,
      borderRadius: BorderRadius.circular(radius1),
      size: Size.square(diameter1),
      child: icon,
      color: color,
    );
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final $borderRadius = borderRadius ?? BorderRadius.circular(8.sc);
    final $customBorder = customBorder ?? RoundedRectangleBorder(borderRadius: $borderRadius);
    return Material(
      color: this.color ?? Colors.transparent,
      child: InkWell(
        customBorder: $customBorder,
        borderRadius: $borderRadius,
        onTap: this.onTap,
        onTapDown: this.onTapDown != null ? (_) => onTapDown!() : null,
        child: this.child != null
            ? ClipRRect(
                borderRadius: $borderRadius,
                child: SizedBox.fromSize(
                  size: this.size,
                  child: child,
                ),
              )
            : null,
      ),
    );
  }
}
