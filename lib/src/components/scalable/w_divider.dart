//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WDivider extends StatelessWidget {
  //
  //
  //

  final double? thickness;
  final Color? color;
  final double? height;
  final Widget? child;
  final Axis? orientation;
  final bool? overflow;
  final double? childSpacing;

  //
  //
  //

  const WDivider({
    super.key,
    this.thickness,
    this.color,
    this.height,
    this.child,
    this.orientation,
    this.overflow,
    this.childSpacing,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final $orientation = orientation ?? Axis.horizontal;
    final $thickness = thickness ?? 1.sc;
    final $color = color ?? Theme.of(context).colorScheme.surfaceContainer;
    final $spacing = childSpacing ?? 8.sc;
    final line = $orientation == Axis.horizontal
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
    final flex = WFlex(
      direction: $orientation,
      mainAxisSize: MainAxisSize.max,
      firstIfNotEmpty: line,
      lastIfNotEmpty: line,
      children: [
        if (this.child != null)
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: $orientation == Axis.vertical ? $spacing : 0,
              horizontal: $orientation == Axis.horizontal ? $spacing : 0,
            ),
            child: this.child,
          ),
      ],
    );

    final $overflow = overflow ?? false;
    final result = $overflow
        ? OverflowBox(
            minWidth: 0,
            minHeight: 0,
            maxWidth: double.infinity,
            maxHeight: double.infinity,
            child: flex,
          )
        : flex;
    return result;
  }
}
