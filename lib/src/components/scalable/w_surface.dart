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
  final Color? borderColor;
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

  const WSurface({
    super.key,
    this.child,
    this.borderRadius,
    this.borderColor,
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
    final borderRadius1 = this.borderRadius ?? BorderRadius.circular(16.sc);
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = this.width?.isInfinite == true || this.expandWidth
            ? constraints.maxWidth
            : this.width;
        final height = this.height?.isInfinite == true || this.expandHeight
            ? constraints.maxHeight
            : this.height;
        return IntrinsicHeight(
          child: IntrinsicWidth(
            child: Stack(
              children: [
                SizedBox(
                  width: width,
                  height: height,
                ),
                ClipRRect(
                  borderRadius: borderRadius1,
                  child: Container(
                    width: double.infinity,
                    decoration: this.decoration.copyWith(
                          border: Border.all(
                            color: this.borderColor ?? Colors.transparent,
                            width: 1.sc,
                          ),
                          borderRadius: borderRadius1,
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
