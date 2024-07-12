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
  final String? actionText;
  final Function()? onTap, onTapAction, onTapClose;

  //
  //
  //

  const WToast({
    super.key,
    this.title,
    this.description,
    this.date,
    this.actionText,
    this.makeup,
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
    final $radius = m?.radius ?? Radius.circular(4.sc);
    final $borderRadius = BorderRadius.all($radius);
    return WInkWell(
      onTap: this.widget.onTap,
      borderRadius: $borderRadius,
      child: Container(
        decoration: BoxDecoration(
          color: m?.backgroundColor,
          borderRadius: $borderRadius,
          boxShadow: m?.shadow,
        ),
        child: IntrinsicHeight(
          child: WRow(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Bar.
              Container(
                width: 4.sc,
                decoration: BoxDecoration(
                  color: m?.barColor,
                  borderRadius: BorderRadius.only(
                    topLeft: $radius,
                    bottomLeft: $radius,
                  ),
                ),
              ),
              // Icon.
              if (m?.icon != null) ...[
                wWidth12(),
                m!.icon!,
              ],
              // Body.
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(12.sc),
                  child: IntrinsicWidth(
                    child: WColumn(
                      children: [
                        IntrinsicHeight(
                          child: WRow(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (this.widget.title != null)
                                Text(
                                  this.widget.title!,
                                  style: m?.titleTextStyle,
                                ),
                              const Spacer(),
                              if (this.widget.date != null)
                                Text(
                                  this.widget.date!,
                                  style: m?.dateTextStyle,
                                ),
                              // Close Icon.
                              if (m?.closeIcon != null && this.widget.onTapClose != null) ...[
                                wWidth8(),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: WInkWell(
                                    onTap: this.widget.onTapClose,
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        minHeight: 32.sc,
                                        minWidth: 32.sc,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(4.sc),
                                        child: m!.closeIcon!,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                        if (this.widget.description != null) ...[
                          if (this.widget.title != null) wHeight4(),
                          Text(
                            this.widget.description!,
                            style: m?.descriptionTextStyle,
                          ),
                        ],
                        if (this.widget.actionText != null && this.widget.onTapAction != null) ...[
                          wHeight8(),
                          WInkWell(
                            onTap: this.widget.onTapAction,
                            child: Padding(
                              padding: EdgeInsets.all(4.sc),
                              child: Text(
                                this.widget.actionText!,
                                style: m?.actionTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
