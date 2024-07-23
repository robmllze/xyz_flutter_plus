//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/material.dart';

import '/@app_properties/src/app_scale.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MCountIndicator extends StatelessWidget {
  //
  //
  //

  final int count;
  final double? size;

  //
  //
  //

  const MCountIndicator({
    super.key,
    required this.count,
    this.size,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final dimension = this.size ?? 20.sc;
    if (count > 0) {
      return IgnorePointer(
        child: Container(
          height: dimension,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 0.35 * dimension),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            borderRadius: BorderRadius.circular(0.5 * dimension),
          ),
          child: Text(
            count.toString(),
            style: TextStyle(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontSize: 0.5 * dimension,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    } else {
      return SizedBox.square(
        dimension: dimension,
      );
    }
  }
}
