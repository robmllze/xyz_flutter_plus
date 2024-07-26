//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:ui';

import 'package:flutter/widgets.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ViewInsetsBuilder extends StatefulWidget {
  //
  //
  //

  final Widget Function(
    BuildContext context,
    ViewPadding viewInsets,
  ) builder;

  //
  //
  //

  const ViewInsetsBuilder({
    super.key,
    required this.builder,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<ViewInsetsBuilder> with WidgetsBindingObserver {
  //
  //
  //

  var _viewInsets = ViewPadding.zero;

  //
  //
  //

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  //
  //
  //

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    this._updateViewInsets();
  }

  //
  //
  //

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    this._updateViewInsets();
  }

  //
  //
  //

  void _updateViewInsets() {
    final viewInsets = View.of(context).viewInsets;
    if (this._viewInsets != viewInsets) {
      this.setState(() {
        this._viewInsets = viewInsets;
      });
    }
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, this._viewInsets);
  }

  //
  //
  //

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
