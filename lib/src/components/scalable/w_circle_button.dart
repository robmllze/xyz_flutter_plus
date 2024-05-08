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

class WCircleButton extends StatelessWidget {
  //
  //
  //

  final Widget child;
  final void Function()? onTap;
  final Color color;

  //
  //
  //

  const WCircleButton({
    super.key,
    this.onTap,
    required this.color,
    required this.child,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Opacity(
        opacity: this.onTap != null ? 1.0 : 0.5,
        child: Container(
          constraints: BoxConstraints(minHeight: 32.sc, minWidth: 32.sc),
          decoration: BoxDecoration(
            color: this.color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 4.sc,
                offset: Offset(0.0, 4.sc),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: this.child,
        ),
      ),
    );
  }
}
