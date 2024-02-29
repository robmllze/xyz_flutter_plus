//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// X|Y|Z & Dev
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/material.dart';

import '/components/w_stateful_builder.dart';
import '/components/w_tap_detector.dart';
import 'app_units.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension ToTappableText on Text {
  //
  //
  //

  Size getSize() {
    final textPainter = TextPainter(
      text: TextSpan(text: this.data, style: this.style),
      maxLines: this.maxLines,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  //
  //
  //

  Widget toTappableText(
    void Function() onTap, [
    Size? detectionBorder,
  ]) {
    return WTapDetector(
      detectionBorder: detectionBorder ?? Size.square(16.sc),
      onTap: onTap,
      child: this,
    );
  }

  //
  //
  //

  Widget toTappableTextAsync(
    Future<void> Function() onTap, [
    Size? detectionBorder,
  ]) {
    var isLoading = false;
    return WStatefulBuilder(
      builder: (_, final state) {
        return WTapDetector(
          detectionBorder: detectionBorder ?? Size.square(16.sc),
          onTap: isLoading
              ? null
              : () async {
                  state.refresh(() {
                    isLoading = true;
                  });
                  await onTap();
                  state.refresh(() {
                    isLoading = false;
                  });
                },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              this,
              if (isLoading) Text("...", style: this.style),
            ],
          ),
        );
      },
    );
  }
}
