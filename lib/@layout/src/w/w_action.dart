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

class WAction extends StatelessWidget {
  //
  //
  //

  final Widget? first, second;
  final void Function()? onTap, onTapFirst, onTapSecond;
  final Widget? firstIcon, secondIcon;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? firstIconPadding;
  final EdgeInsets? firstPadding;
  final EdgeInsets? secondPadding;
  final EdgeInsets? secondIconPadding;

  //
  //
  //

  const WAction({
    super.key,
    this.first,
    this.second,
    this.firstIcon,
    this.secondIcon,
    this.onTap,
    this.onTapFirst,
    this.onTapSecond,
    this.width,
    this.height,
    this.padding,
    this.firstIconPadding,
    this.firstPadding,
    this.secondPadding,
    this.secondIconPadding,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final firstIconPadding = this.firstIconPadding ?? EdgeInsets.only(left: 8.sc);
    final firstPadding = this.firstPadding ?? EdgeInsets.only(left: 16.sc);
    final secondIconPadding = this.secondIconPadding ?? EdgeInsets.only(right: 8.sc);
    final secondPadding = this.secondPadding ?? EdgeInsets.only(right: 16.sc);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: this.onTap,
      child: Padding(
        padding: this.padding ?? EdgeInsets.zero,
        child: SizedBox(
          width: this.width,
          height: this.height,
          child: Align(
            alignment: Alignment.center,
            child: Row(
              children: [
                if (this.firstIcon != null)
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: this.onTapFirst,
                    child: Padding(
                      padding: firstIconPadding,
                      child: this.firstIcon,
                    ),
                  ),
                if (this.first != null)
                  Expanded(
                    child: Padding(
                      padding: firstIcon == null ? firstIconPadding : firstPadding,
                      child: this.first!,
                    ),
                  ),
                if (this.second != null)
                  Expanded(
                    child: Padding(
                      padding: secondIcon == null ? secondIconPadding : secondPadding,
                      child: this.second!,
                    ),
                  ),
                if (this.secondIcon != null)
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: this.onTapSecond,
                    child: Padding(
                      padding: secondIconPadding,
                      child: this.secondIcon,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
