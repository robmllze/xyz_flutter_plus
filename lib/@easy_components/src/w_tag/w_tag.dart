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
import 'package:xyz_gen_annotations/xyz_gen_annotations.dart';

import '/@app_properties/src/_all_src.g.dart';
import '/@easy_components/src/_all_src.g.dart';
import '/@theme/src/_all_src.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateMakeups(
  properties: {
    'backgroundColor': 'Color?',
    'textStyle': 'TextStyle?',
    'padding': 'EdgeInsets?',
    'margin': 'EdgeInsets?',
    'borderRadius': 'BorderRadius?',
  },
)
class WTag extends StatelessWidget {
  //
  //
  //

  final String text;
  final void Function()? onTap;
  final WTagMakeup? makeup;

  //
  //
  //

  const WTag({
    super.key,
    required this.text,
    this.onTap,
    this.makeup,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return text.isNotEmpty
        ? WInkWell(
            onTap: this.onTap,
            child: Container(
              decoration: BoxDecoration(
                color: this.makeup?.backgroundColor ??
                    Theme.of(context).colorScheme.secondary.withOpacity(0.25),
                borderRadius: makeup?.borderRadius ?? BorderRadius.circular(4.sc),
              ),
              margin: this.makeup?.margin ?? EdgeInsets.zero,
              padding:
                  this.makeup?.padding ?? EdgeInsets.symmetric(vertical: 4.sc, horizontal: 6.sc),
              child: Text(
                this.text,
                style: this.makeup?.textStyle ?? Theme.of(context).textTheme.bodySmall?.wMedium,
              ),
            ),
          )
        : const SizedBox();
  }
}
