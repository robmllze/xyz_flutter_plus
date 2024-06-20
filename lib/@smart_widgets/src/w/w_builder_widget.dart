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
import 'package:xyz_pod/xyz_pod.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract class WBuilderWidget<T> extends StatelessWidget {
  //
  //
  //

  final TOnDataBuilder<T> onDataBuilder;
  final TOnLoadingBuilder? onLoadingBuilder;
  final TOnNoDataBuilder? onNoUsableDataBuilder;
  final Widget? child;

  //
  //
  //

  const WBuilderWidget({
    super.key,
    required this.onDataBuilder,
    this.onLoadingBuilder,
    this.onNoUsableDataBuilder,
    this.child,
  });

  //
  //
  //

  Widget builder(
    BuildContext context,
    Widget? child,
    RespondingBuilderSnapshot<T> snapshot,
  ) {
    return _builder<T>(
      onDataBuilder,
      onLoadingBuilder,
      onNoUsableDataBuilder,
      context,
      child,
      snapshot,
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Widget _builder<T>(
  TOnDataBuilder<T> onDataBuilder,
  TOnLoadingBuilder? onLoadingBuilder,
  TOnNoDataBuilder? onNoUsableDataBuilder,
  BuildContext context,
  Widget? child,
  RespondingBuilderSnapshot<T> snapshot,
) {
  Widget? widget;
  if (snapshot.hasData) {
    if (snapshot.hasUsableData) {
      final data = snapshot.data as T;
      widget = onDataBuilder(context, child, data);
    } else {
      widget = onNoUsableDataBuilder?.call(context, child);
    }
  } else {
    widget = onLoadingBuilder?.call(context, child);
  }
  widget ??= const SizedBox.shrink();
  return widget;
}
