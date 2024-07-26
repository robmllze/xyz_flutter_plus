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

  final Widget? child;

  //
  //
  //

  final Widget Function(ViewInsetsBuilderParams params) builder;

  //
  //
  //

  const ViewInsetsBuilder({
    super.key,
    required this.builder,
    this.child,
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
  late final Widget? _staticChild;

  //
  //
  //

  bool _hasReachedMax = false;
  bool _hasReachedMin = false;

  //
  //
  //

  @override
  void initState() {
    super.initState();
    this._staticChild = this.widget.child;
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
    final reachedMax = viewInsets.top > _viewInsets.top ||
        viewInsets.bottom > _viewInsets.bottom ||
        viewInsets.left > _viewInsets.left ||
        viewInsets.right > _viewInsets.right;
    final reachedMin = viewInsets.top == 0 &&
        viewInsets.bottom == 0 &&
        viewInsets.left == 0 &&
        viewInsets.right == 0;
    if ((reachedMax && !_hasReachedMax) || (reachedMin && !_hasReachedMin)) {
      this.setState(() {
        this._viewInsets = viewInsets;
        this._hasReachedMax = reachedMax;
        this._hasReachedMin = reachedMin;
      });
    }
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final params = ViewInsetsBuilderParams._(
      context: context,
      child: this._staticChild,
      viewInsets: this._viewInsets,
    );
    return this.widget.builder(params);
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

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ViewInsetsBuilderParams {
  //
  //
  //

  final BuildContext context;
  final Widget? child;
  final ViewPadding viewInsets;

  //
  //
  //

  const ViewInsetsBuilderParams._({
    required this.context,
    required this.child,
    required this.viewInsets,
  });
}
