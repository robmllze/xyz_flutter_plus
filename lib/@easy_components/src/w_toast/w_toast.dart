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
import '/@layout/src/_all_src.g.dart';
import '/@easy_components/src/_all_src.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateMakeups(
  properties: {
    'actionTextStyle': 'TextStyle?',
    'backgroundColor': 'Color?',
    'barColor': 'Color?',
    'closeIcon': 'Widget?',
    'dateTextStyle': 'TextStyle?',
    'descriptionTextStyle': 'TextStyle?',
    'icon': 'Widget?',
    'radius': 'Radius?',
    'shadow': 'List<BoxShadow>?',
    'titleTextStyle': 'TextStyle?',
  },
)
class WToast extends StatefulWidget {
  //
  //
  //

  final WToastMakeup? makeup;
  final String? title;
  final String? description;
  final String? date;
  final String? action;
  final double? width, height;
  final Function()? onTap, onTapAction, onTapClose;

  //
  //
  //

  const WToast({
    super.key,
    this.title,
    this.description,
    this.date,
    this.action,
    this.makeup,
    this.width,
    this.height,
    this.onTap,
    this.onTapAction,
    this.onTapClose,
  });

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WToast> {
  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final m = this.widget.makeup;
    final radius = m?.radius ?? Radius.circular(4.sc);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: this.widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: m?.backgroundColor,
          borderRadius: BorderRadius.all(radius),
          boxShadow: m?.shadow,
        ),
        child: WIntrinsicRow(
          children: [
            Container(
              width: 4.sc,
              decoration: BoxDecoration(
                color: m?.barColor,
                borderRadius: BorderRadius.only(
                  topLeft: radius,
                  bottomLeft: radius,
                ),
              ),
            ),
            if (m?.icon != null) ...[
              wWidth8(),
              m!.icon!,
            ],
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.sc),
                child: WColumn(
                  children: [
                    if (widget.title != null)
                      Builder(
                        builder: (_) {
                          final title = Text(
                            this.widget.title!,
                            style: m?.titleTextStyle,
                          );

                          final date = this.widget.date;
                          return date == null
                              ? title
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(child: title),
                                    wWidth8(),
                                    Text(
                                      date,
                                      style: m?.dateTextStyle,
                                    ),
                                  ],
                                );
                        },
                      ),
                    if (this.widget.description != null) ...[
                      if (this.widget.title != null) wHeight4(),
                      Text(
                        this.widget.description!,
                        style: m?.descriptionTextStyle,
                      ),
                    ],
                    if (this.widget.action != null && this.widget.onTapAction != null) ...[
                      wHeight8(),
                      WInkWell(
                        onTap: this.widget.onTapAction,
                        child: Text(
                          this.widget.action!,
                          style: m?.actionTextStyle,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            if (this.widget.onTapClose != null) ...[
              wWidth8(),
              WInkWell(
                onTap: this.widget.onTapClose,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 32.sc,
                    minWidth: 32.sc,
                  ),
                  child: Center(
                    child: m?.closeIcon,
                  ),
                ),
              ),
              wWidth8(),
            ],
          ],
        ),
      ),
    );
  }
}
