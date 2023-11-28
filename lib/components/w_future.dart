//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Shared
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WFuture<T> extends StatelessWidget {
  //
  //
  //

  final Future<T?> future;
  final Widget? Function(BuildContext context, AsyncSnapshot<T?> result)? onActive,
      onWaiting,
      onNone,
      onDone;
  final WLoaderMakeup? makeup;

  //
  //
  //

  const WFuture({
    Key? key,
    required this.future,
    this.onActive,
    this.onWaiting,
    this.onNone,
    this.onDone,
    this.makeup,
  }) : super(key: key);

  //
  //
  //

  @override
  Widget build(_) {
    return FutureBuilder<T?>(
      future: this.future,
      builder: (final context, final snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return this.onNone?.call(context, snapshot) ?? const SizedBox();
          case ConnectionState.waiting:
            return this.onWaiting?.call(context, snapshot) ?? WLoader(makeup: this.makeup);
          case ConnectionState.active:
            return this.onActive?.call(context, snapshot) ?? const SizedBox();
          case ConnectionState.done:
            return this.onDone?.call(context, snapshot) ?? const SizedBox();
        }
      },
    );
  }
}
