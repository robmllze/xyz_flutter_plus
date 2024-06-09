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

class WSurface extends StatelessWidget {
  //
  //
  //

  final Widget? child;
  final BorderRadius borderRadius;
  final BoxConstraints? constraints;
  final BoxDecoration? decoration;
  final EdgeInsets? padding;
  final Color? color;
  final double? width;
  final double? height;

  //
  //
  //

  const WSurface({
    super.key,
    this.child,
    this.borderRadius = BorderRadius.zero,
    this.constraints,
    this.decoration,
    this.padding,
    this.color,
    this.height,
    this.width,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    var $decoration = this.decoration ?? const BoxDecoration();
    final $color = $decoration.color ??
        this.color ??
        Theme.of(context).colorScheme.surfaceContainer;
    final $borderRadius = $decoration.borderRadius ?? borderRadius;
    $decoration = $decoration.copyWith(
      color: $color,
      borderRadius: $borderRadius,
    );
    return ClipRRect(
      borderRadius: $borderRadius,
      child: Container(
        width: width,
        height: height,
        constraints: this.constraints,
        decoration: $decoration,
        padding: this.padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
