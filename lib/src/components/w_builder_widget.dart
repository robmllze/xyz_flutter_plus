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
      final data = snapshot.data!;
      widget = onDataBuilder(context, child, data);
    } else {
      widget = onNoUsableDataBuilder?.call(context, child);
    }
  } else {
    widget = onLoadingBuilder?.call(context, child) ?? const WCircularProgressIndicator();
  }
  widget ??= const SizedBox.shrink();
  return widget;
}
