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

class WCountIndicator extends StatelessWidget {
  //
  //
  //

  final int count;

  //
  //
  //

  const WCountIndicator({
    super.key,
    required this.count,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    if (count > 0) {
      final size = 20.sc;
      return IgnorePointer(
        child: Container(
          height: size,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 0.35 * size),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            borderRadius: BorderRadius.circular(0.5 * size),
          ),
          child: Text(
            count.toString(),
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontSize: 0.5 * size,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
