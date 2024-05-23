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

class WGlobalOverlay extends StatefulWidget {
  //
  //
  //

  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final Widget? background;
  final Widget child;

  //
  //
  //

  const WGlobalOverlay({
    super.key,
    this.left,
    this.right,
    this.top,
    this.bottom,
    this.background,
    required this.child,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WGlobalOverlay> {
  //
  //
  //

  late final OverlayEntry _overlayEntry;

  //
  //
  //

  @override
  void initState() {
    super.initState();
    this._createOverlayEntry();
  }

  //
  //
  //

  @override
  void dispose() {
    this._overlayEntry.remove();
    super.dispose();
  }

  //
  //
  //

  void _createOverlayEntry() {
    this._overlayEntry = OverlayEntry(
      builder: (context) {
        final l = this.widget.left ?? 0.0;
        final r = this.widget.right;
        final t = this.widget.top ?? 0.0;
        final b = this.widget.bottom;
        final x = l + (r != null ? MediaQuery.of(context).size.width - r : 0.0);
        final y =
            t + (b != null ? MediaQuery.of(context).size.height - b : 0.0);
        return Stack(
          children: [
            if (this.widget.background != null) this.widget.background!,
            Positioned(
              top: y,
              left: x,
              child: this.widget.child,
            ),
          ],
        );
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(this._overlayEntry);
    });
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
