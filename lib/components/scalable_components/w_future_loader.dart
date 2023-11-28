//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WFutureLoader extends StatelessWidget {
  //
  //
  //

  final WLoaderMakeup? makeup;
  final Future<void> future;
  final bool shouldIndicateWhenDone;

  //
  //
  //

  const WFutureLoader({
    Key? key,
    this.makeup,
    required this.future,
    this.shouldIndicateWhenDone = true,
  }) : super(key: key);

  //
  //
  //

  @override
  Widget build(_) {
    return SizedBox.square(
      dimension: this.makeup?.size,
      child: Center(
        child: LayoutBuilder(
          builder: (_, final constraints) {
            final h = constraints.maxHeight;
            final w = constraints.maxWidth;
            final smallest = w < h ? w : h;
            return WFuture<void>(
              future: this.future,
              onDone: (_, final snapshot) {
                if (snapshot.hasError) {
                  return Icon(
                    Icons.error_outline,
                    color: this.makeup?.errorColor,
                    size: smallest,
                  );
                }
                if (shouldIndicateWhenDone) {
                  return Icon(
                    Icons.check_circle_outline,
                    color: this.makeup?.successColor,
                    size: smallest,
                  );
                }
                return null;
              },
              onWaiting: (_, __) => SizedBox.square(
                dimension: smallest,
                child: Padding(
                  padding: EdgeInsets.all(0.12 * smallest),
                  child: CircularProgressIndicator(
                    color: Colors.transparent,
                    backgroundColor: this.makeup?.backgroundColor,
                    valueColor: this.makeup?.valueColor,
                    strokeWidth: 0.11 * smallest,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
