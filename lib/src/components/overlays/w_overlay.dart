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

class WOverlay extends StatefulWidget {
  //
  //
  //

  final Widget? child;

  //
  //
  //

  const WOverlay({
    super.key,
    this.child,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WOverlay> {
  //
  //
  //

  OverlayEntry? _overlayEntry;
  ScrollableState? _scrollable;
  ScrollPosition? _scrollPosition;

  //
  //
  //

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(this._measureAndOverlay);
  }

  //
  //
  //

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    try {
      this._scrollable = Scrollable.of(context);
    } catch (_) {}
    if (this._scrollable != null) {
      this._scrollPosition = this._scrollable!.position;
      this
          ._scrollPosition!
          .isScrollingNotifier
          .addListener(this._scrollListener);
    }
  }

  //
  //
  //

  void _scrollListener() {
    if (this._overlayEntry != null) {
      this._overlayEntry!.remove();
      this._measureAndOverlay(null);
    }
  }

  //
  //
  //

  void _measureAndOverlay(_) {
    final renderBox =
        this._offstageKey.currentContext?.findRenderObject() as RenderBox;
    final childSize = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);
    this._positionOverlay(childSize, position);
  }

  //
  //
  //

  void _positionOverlay(Size childSize, Offset position) {
    final screenSize = MediaQuery.of(context).size;
    var x = position.dx;
    var y = position.dy;
    if (x + childSize.width > screenSize.width) {
      x = screenSize.width - childSize.width;
    }
    if (y + childSize.height > screenSize.height) {
      y = screenSize.height - childSize.height;
    }
    if (x < 0) {
      x = 0;
    }
    if (y < 0) {
      y = 0;
    }
    this._overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: x,
          top: y,
          child: Material(
            type: MaterialType.transparency,
            child: this.widget.child,
          ),
        );
      },
    );

    Overlay.of(context).insert(this._overlayEntry!);
  }

  //
  //
  //

  @override
  void dispose() {
    this._overlayEntry?.remove();
    if (this._scrollPosition != null) {
      this
          ._scrollPosition!
          .isScrollingNotifier
          .removeListener(this._scrollListener);
    }
    super.dispose();
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
