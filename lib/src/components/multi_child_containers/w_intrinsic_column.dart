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

/// We can use the IntrinsicColumn to underline some text:
///
/// ```dart
/// WIntrinsicColumn(
///   children: [
///     Text('Hello World!'),
///     // The width of the Container will match the width of the Text.
///     Container(
///       // Underline thickness.
///       height: 2.0,
///       // Underline color.
///       color: Colors.red,
///     ),
///   ],
/// )
/// ```
class WIntrinsicColumn extends StatelessWidget {
  //
  //
  //

  final Widget? firstIfNotEmpty;
  final Widget? divider;
  final Widget? lastIfNotEmpty;
  final List<Widget?>? children;

  //
  //
  //

  const WIntrinsicColumn({
    super.key,
    this.firstIfNotEmpty,
    this.divider,
    this.lastIfNotEmpty,
    this.children,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: WFlex.column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        firstIfNotEmpty: this.firstIfNotEmpty,
        divider: this.divider,
        lastIfNotEmpty: this.lastIfNotEmpty,
        children: this.children,
      ),
    );
  }
}
