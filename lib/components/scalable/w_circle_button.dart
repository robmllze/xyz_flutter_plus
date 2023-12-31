//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

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
    Key? key,
    this.onTap,
    required this.color,
    required this.child,
  }) : super(key: key);

  //
  //
  //

  @override
  Widget build(_) {
    return GestureDetector(
      onTap: this.onTap,
      child: Opacity(
        opacity: this.onTap != null ? 1.0 : 0.5,
        child: Container(
          constraints: BoxConstraints(minHeight: $32, minWidth: $32),
          decoration: BoxDecoration(
            color: this.color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: $4,
                offset: Offset(0.0, $4),
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
