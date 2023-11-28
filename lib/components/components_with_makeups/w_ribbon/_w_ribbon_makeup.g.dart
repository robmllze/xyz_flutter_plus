//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED BY XYZ_GEN - DO NOT MODIFY BY HAND
// See: https://github.com/robmllze/xyz_gen
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

part of 'w_ribbon.dart'; // part '_w_ribbon_makeup.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WRibbonMakeup {
  //
  //
  //

  Color? color;
  TextStyle? textStyle;
  BorderRadius? borderRadius;
  EdgeInsets? padding;
  Widget? icon;

  //
  //
  //

  WRibbonMakeup({
    this.color,
    this.textStyle,
    this.borderRadius,
    this.padding,
    this.icon,
  });

  //
  //
  //

  WRibbonMakeup copyWith({
    Color? color,
    TextStyle? textStyle,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
    Widget? icon,
  }) {
    return WRibbonMakeup(
      color: color ?? this.color,
      textStyle: textStyle ?? this.textStyle,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      icon: icon ?? this.icon,
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef FWRibbonMakeup = WRibbonMakeup Function();
