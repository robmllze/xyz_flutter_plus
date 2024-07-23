//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/material.dart';

import '/@easy_animations/src/_all_src.g.dart';
import '/@easy_dialogs/src/_all_src.g.dart';
import '/@smart_widgets/src/_all_src.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MOverlayPopup extends StatefulWidget {
  //
  //
  //

  final Widget Function(
    BuildContext context,
    VoidCallback open,
  )? buttonBuilder;

  final Widget Function(
    BuildContext context,
    VoidCallback close,
  )? itemBuilder;

  final Color? backgroundColor;

  final void Function()? onTapDownBackground;

  //
  //
  //

  const MOverlayPopup({
    super.key,
    this.buttonBuilder,
    this.itemBuilder,
    this.backgroundColor,
    this.onTapDownBackground,
  });

  //
  //
  //

  @override
  State<MOverlayPopup> createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<MOverlayPopup> {
  //
  //
  //

  var _open = false;

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final button = widget.buttonBuilder?.call(
          context,
          () => this.setState(() => this._open = true),
        ) ??
        const SizedBox.shrink();

    final item = widget.itemBuilder?.call(
          context,
          () => this.setState(() => this._open = false),
        ) ??
        const SizedBox.shrink();

    final $screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        button,
        if (this._open) ...[
          WGlobalOverlay(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTapDown: (details) {
                this.setState(() => this._open = false);
                this.widget.onTapDownBackground?.call();
              },
              child: WAnimatedFade(
                layer2: Container(
                  color: Theme.of(context).colorScheme.surfaceDim,
                  width: $screenSize.width,
                  height: $screenSize.height,
                ),
              ),
            ),
          ),
          MOverlay(
            child: item,
          ),
        ],
      ],
    );
  }
}
