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
  final Color? color;
  final Color? borderColor;
  final double? cornerRadius;

  //
  //
  //

  const WSurface({
    super.key,
    required this.child,
    this.color,
    this.borderColor,
    this.cornerRadius,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sc),
      decoration: BoxDecoration(
        color: this.color ?? Theme.of(context).colorScheme.surfaceContainer,
        border: Border.all(
          color: this.borderColor ?? Colors.transparent,
          width: 1.sc,
        ),
        borderRadius: BorderRadius.circular(this.cornerRadius ?? 8.sc),
      ),
      child: this.child,
    );
  }
}
