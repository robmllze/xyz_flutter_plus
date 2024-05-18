//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:ui' as ui;

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WBlurryContainer extends StatelessWidget {
  //
  //
  //

  final Widget? child;
  final double? sigma;
  final double opacity;
  final BorderRadius? borderRadius;
  final BoxDecoration decoration;
  final EdgeInsets? padding;
  final Color? color;
  final double? width;
  final double? height;
  final bool expandHeight;
  final bool expandWidth;

  //
  //
  //

  const WBlurryContainer({
    super.key,
    this.child,
    this.sigma = 8.0,
    this.opacity = 0.75,
    this.borderRadius,
    this.decoration = const BoxDecoration(),
    this.padding,
    this.color,
    this.height,
    this.width,
    this.expandHeight = false,
    this.expandWidth = false,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ??
        BorderRadius.only(
          bottomLeft: Radius.circular(16.sc),
          bottomRight: Radius.circular(16.sc),
        );
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = this.width?.isInfinite == true || this.expandWidth
            ? constraints.maxWidth
            : this.width;
        final height = this.height?.isInfinite == true || this.expandHeight
            ? constraints.maxHeight
            : this.height;
        final c = this.color ?? Theme.of(context).colorScheme.surfaceContainer;
        return IntrinsicHeight(
          child: IntrinsicWidth(
            child: Stack(
              children: [
                SizedBox(
                  width: width,
                  height: height,
                ),
                ClipRRect(
                  borderRadius: borderRadius,
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(
                      sigmaX: this.sigma!,
                      sigmaY: this.sigma!,
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: this.decoration.copyWith(
                            color: c.withOpacity(c.opacity * opacity),
                            borderRadius: borderRadius,
                          ),
                    ),
                  ),
                ),
                if (this.child != null)
                  Padding(
                    padding: this.padding ?? EdgeInsets.zero,
                    child: this.child!,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
