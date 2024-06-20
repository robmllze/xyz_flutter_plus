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

import '/@app_properties/src/_all_src.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WBackgroundGrid extends StatelessWidget {
  //
  //
  //

  final Widget? icon;
  final double? gridSize;
  final Widget? child;

  //
  //
  //

  const WBackgroundGrid({
    super.key,
    this.icon,
    this.child,
    this.gridSize,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final g = this.gridSize ?? 40.sc;
    final crossAxisCount = (MediaQuery.of(context).size.width / g).ceil();
    return Stack(
      children: [
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return SizedBox.square(
              dimension: g,
              child: Center(
                child: this.icon,
              ),
            );
          },
        ),
        if (this.child != null) this.child!,
      ],
    );
  }
}
