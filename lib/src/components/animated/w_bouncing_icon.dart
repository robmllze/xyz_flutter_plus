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

class WBouncingIcon extends StatefulWidget {
  //
  //
  //

  final Widget icon;
  final bool bounce;

  //
  //
  //

  const WBouncingIcon({
    super.key,
    this.bounce = true,
    required this.icon,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WBouncingIcon> with SingleTickerProviderStateMixin {
  //
  //
  //

  late AnimationController _controller;
  late Animation<double> _animation;

  //
  //
  //

  @override
  void initState() {
    super.initState();
    this._controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    this._animation = Tween<double>(begin: 0.0, end: -24.sc).animate(
      CurvedAnimation(parent: this._controller, curve: Curves.easeOutQuad),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          this._controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          if (this.widget.bounce) {
            this._controller.forward();
          }
        }
      });

    if (this.widget.bounce) {
      this._controller.forward();
    }
  }

  //
  //
  //

  @override
  void didUpdateWidget(WBouncingIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (this.widget.bounce != oldWidget.bounce) {
      if (this.widget.bounce) {
        this._controller.forward();
      } else {
        this._controller.stop();
        this._controller.reverse(from: this._controller.value);
      }
    }
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: this._controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, this._animation.value),
        child: child,
      ),
      child: this.widget.icon,
    );
  }

  //
  //
  //

  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }
}
