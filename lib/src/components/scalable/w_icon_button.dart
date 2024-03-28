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

class WIconButton extends StatelessWidget {
  //
  //
  //

  final Widget icon;
  final void Function()? onTap;

  //
  //
  //

  const WIconButton({
    super.key,
    required this.icon,
    this.onTap,
  });

  //
  //
  //

  @override
  Widget build(_) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: this.onTap != null ? (_) => this.onTap?.call() : null,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 48.sc,
          minWidth: 48.sc,
        ),
        child: Opacity(
          opacity: this.onTap != null ? 1.0 : 0.5,
          child: this.icon,
        ),
      ),
    );
  }
}
