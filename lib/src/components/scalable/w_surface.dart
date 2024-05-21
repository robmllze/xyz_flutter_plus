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
  final BorderRadius? borderRadius;
  final BoxConstraints constraints;
  final BoxDecoration decoration;
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
    this.borderRadius,
    this.constraints = const BoxConstraints(),
    this.decoration = const BoxDecoration(),
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
    final radius = Radius.circular(16.sc);
    final borderRadius1 =
        this.borderRadius ?? BorderRadius.only(bottomLeft: radius, bottomRight: radius);
    final color1 = this.color ?? Theme.of(context).colorScheme.surfaceContainer;
    return ClipRRect(
      borderRadius: borderRadius1,
      child: Container(
        width: width,
        height: height,
        constraints: this.constraints,
        decoration: this.decoration.copyWith(
              color: color1,
              borderRadius: borderRadius1,
            ),
        padding: this.padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}