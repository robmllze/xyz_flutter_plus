//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:df_scalable/df_scalable.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WCustomScrollBar extends StatefulWidget {
  //
  //
  //

  final ScrollController? scrollController;
  final Widget? child;
  final Color? color;

  //
  //
  //

  const WCustomScrollBar({
    super.key,
    this.scrollController,
    this.child,
    this.color,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WCustomScrollBar> {
  //
  //
  //

  Timer? _timer;
  bool _isDragging = false;

  //
  //
  //

  @override
  void dispose() {
    this._timer?.cancel();
    super.dispose();
  }

  //
  //
  //

  void _startTimer() {
    this._timer = Timer(const Duration(seconds: 1), () {
      super.setState(() {
        this._isDragging = false;
      });
    });
  }

  //
  //
  //

  void _resetTimer() {
    this._timer?.cancel();
    if (!_isDragging) {
      super.setState(() {
        this._isDragging = true;
      });
      this._startTimer();
    }
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Listener(
          onPointerDown: (_) => this._resetTimer(),
          onPointerMove: (_) => this._resetTimer(),
          child: this.widget.child,
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: this._isDragging ? 1.0 : 0.0,
          child: Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 8.sc,
              decoration: BoxDecoration(
                color: this.widget.color,
                borderRadius: BorderRadius.circular(4.sc),
              ),
              child: GestureDetector(
                onVerticalDragStart: (_) => _resetTimer(),
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  final offset = details.delta.dy / context.size!.height;
                  if (this.widget.scrollController != null) {
                    this.widget.scrollController?.jumpTo(
                          this.widget.scrollController!.offset +
                              offset * widget.scrollController!.position.maxScrollExtent,
                        );
                  }
                  this._resetTimer();
                },
                child: Container(
                  width: double.infinity,
                  height: 60.sc,
                  decoration: BoxDecoration(
                    color: this.widget.color,
                    borderRadius: BorderRadius.circular(4.sc),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
