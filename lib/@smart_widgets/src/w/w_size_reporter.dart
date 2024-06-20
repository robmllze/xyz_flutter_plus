//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/widgets.dart';

import '/@smart_widgets/src/_all_src.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WSizeReporter extends StatefulWidget {
  //
  //
  //

  final Widget child;
  final Function(BuildContext context, Widget child, Size size) builder;

  //
  //
  //

  const WSizeReporter({
    super.key,
    required this.child,
    required this.builder,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WSizeReporter> {
  //
  //
  //

  final _key = GlobalKey();
  Size? _childSize;

  //
  //
  //

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(this._onPostFrame);
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (this._childSize != null) {
          return this.widget.builder(
                context,
                this.widget.child,
                this._childSize!,
              );
        }
        return WSizeObserver(
          key: this._key,
          onChange: this._onChangeSize,
          child: this.widget.child,
        );
      },
    );
  }

  //
  //
  //

  void _onPostFrame(_) {
    final renderBox = _key.currentContext?.findRenderObject() as RenderBox;
    final size = renderBox.size;
    this._onChangeSize(size);
  }

  //
  //
  //

  void _onChangeSize(Size size) {
    if (this._childSize != size) {
      this.setState(() {
        this._childSize = size;
      });
    }
  }
}
