//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/gestures.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WInlineText extends StatelessWidget {
  //
  //
  //

  final String text;
  final TextStyle? style;
  final Map<String, TextStyle> namedStyles;
  final Map<String, Widget> namedWidgets;
  final Map<String, VoidCallback> namedCallbacks;
  final TextAlign textAlign;
  final bool softWrap;

  //
  //
  //

  const WInlineText(
    this.text, {
    super.key,
    this.style,
    this.namedStyles = const {},
    this.namedWidgets = const {},
    this.namedCallbacks = const {},
    this.textAlign = TextAlign.left,
    this.softWrap = true,
  });

  //
  //
  //

  @override
  Widget build(final context) {
    const opening = '{{';
    const closing = '}}';

    final segments = text.split(RegExp(r'(?<=' + closing + r')|(?=' + opening + r')'));
    final spans = <InlineSpan>[];

    for (final segment in segments) {
      if (segment.startsWith(opening) && segment.endsWith(closing)) {
        final data = segment.substring(2, segment.length - 2);
        final parts = data.split(':');
        final length = parts.length;
        final key = parts.firstOrNull;
        final widget = namedWidgets[key];
        final style = namedStyles[key] ?? namedStyles.values.firstOrNull ?? this.style;
        final callback = namedCallbacks[key];
        if (widget != null) {
          spans.add(
            WidgetSpan(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: callback,
                child: widget,
              ),
            ),
          );
        } else {
          final text = length == 2 ? parts[1] : data;
          spans.add(
            TextSpan(
              text: text,
              style: style,
              recognizer: TapGestureRecognizer()..onTap = callback,
            ),
            // WidgetSpan(
            //   child: GestureDetector(
            //     behavior: HitTestBehavior.translucent,
            //     onTap: callback,
            //     child: Text(
            //       text,
            //       style: style,
            //       textAlign: this.textAlign,
            //       softWrap: this.softWrap,
            //     ),
            //   ),
            // ),
          );
        }
      } else {
        final data = segment.replaceAll('\\$opening', opening).replaceAll('\\$closing', opening);
        spans.add(
          TextSpan(
            text: data,
            style: this.style ?? namedStyles.values.firstOrNull,
          ),
          // WidgetSpan(
          //   child: Text(
          //     data,
          //     style: this.style ?? namedStyles.values.firstOrNull,
          //     textAlign: this.textAlign,
          //     softWrap: this.softWrap,
          //   ),
          // ),
        );
      }
    }

    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: RichText(
        text: TextSpan(children: spans),
        textAlign: this.textAlign,
        softWrap: this.softWrap,
      ),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

TextSpan createTextSpanFromList(List<String> inputs) {
  final spans = inputs.map((final value) {
    return TextSpan(
      text: value,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.sc,
      ),
    );
  }).toList();

  return TextSpan(children: spans);
}
