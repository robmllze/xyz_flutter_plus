//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:xyz_pod/xyz_pod.dart';

import 'package:flutter/widgets.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WWidgetCalculator extends StatefulWidget {
  //
  //
  //

  final Widget? child;
  final void Function(RenderBox? renderBox)? onPostRender;
  final Pod<RenderBox?>? pRenderBox;

  //
  //
  //

  const WWidgetCalculator({
    super.key,
    this.child,
    this.pRenderBox,
    this.onPostRender,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WWidgetCalculator> {
  //
  //
  //

  final _key = GlobalKey();

  //
  //
  //

  @override
  void initState() {
    super.initState();
    // Wait for the layout to finish before measuring the size.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox =
          this._key.currentContext?.findRenderObject() as RenderBox?;
      this.widget.pRenderBox?.set(renderBox);
      this.widget.onPostRender?.call(renderBox);
    });
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, final constraints) {
        return SizedBox(
          key: this._key,
          child: this.widget.child,
        );
      },
    );
  }
}
