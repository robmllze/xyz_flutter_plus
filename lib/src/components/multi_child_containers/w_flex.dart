//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:collection';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WFlex extends Flex {
  //
  //
  //

  final Widget? firstIfNotEmpty;
  final Widget? divider;
  final Widget? lastIfNotEmpty;
  final List<Widget?>? elements;

  //
  //
  //

  const WFlex({
    super.key,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
    CrossAxisAlignment? crossAxisAlignment,
    VerticalDirection? verticalDirection,
    Axis? direction,
    List<Widget?>? children,
    super.textDirection,
    super.textBaseline,
    this.firstIfNotEmpty,
    this.divider,
    this.lastIfNotEmpty,
    this.elements,
  }) : super(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          mainAxisSize: mainAxisSize ?? MainAxisSize.min,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
          verticalDirection: verticalDirection ?? VerticalDirection.down,
          direction: direction ?? Axis.horizontal,
        );

  //
  //
  //

  factory WFlex.column({
    Key? key,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
    CrossAxisAlignment? crossAxisAlignment,
    VerticalDirection? verticalDirection,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
    Widget? firstIfNotEmpty,
    Widget? divider,
    Widget? lastIfNotEmpty,
    List<Widget?>? children,
  }) {
    return WFlex(
      direction: Axis.vertical,
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      verticalDirection: verticalDirection,
      textDirection: textDirection,
      textBaseline: textBaseline,
      firstIfNotEmpty: firstIfNotEmpty,
      divider: divider,
      lastIfNotEmpty: lastIfNotEmpty,
      elements: children,
    );
  }

  //
  //
  //

  factory WFlex.row({
    Key? key,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
    CrossAxisAlignment? crossAxisAlignment,
    VerticalDirection? verticalDirection,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
    Widget? firstIfNotEmpty,
    Widget? divider,
    Widget? lastIfNotEmpty,
    List<Widget?>? children,
  }) {
    return WFlex(
      direction: Axis.horizontal,
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      verticalDirection: verticalDirection,
      textDirection: textDirection,
      textBaseline: textBaseline,
      firstIfNotEmpty: firstIfNotEmpty,
      divider: divider,
      lastIfNotEmpty: lastIfNotEmpty,
      elements: children,
    );
  }

  //
  //
  //

  WFlex copyWith({
    Key? key,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
    CrossAxisAlignment? crossAxisAlignment,
    VerticalDirection? verticalDirection,
    Axis? direction,
    List<Widget?>? children,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
    Widget? firstIfNotEmpty,
    Widget? divider,
    Widget? lastIfNotEmpty,
    List<Widget?>? elements,
  }) {
    return WFlex(
      key: key ?? this.key,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      mainAxisSize: mainAxisSize ?? this.mainAxisSize,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      verticalDirection: verticalDirection ?? this.verticalDirection,
      direction: direction ?? this.direction,
      textDirection: textDirection ?? this.textDirection,
      textBaseline: textBaseline ?? this.textBaseline,
      firstIfNotEmpty: firstIfNotEmpty ?? this.firstIfNotEmpty,
      divider: divider ?? this.divider,
      lastIfNotEmpty: lastIfNotEmpty ?? this.lastIfNotEmpty,
      elements: elements ?? this.elements,
    );
  }

  //
  //
  //

  @override
  List<Widget> get children {
    final elements = this.elements?.nonNulls ?? [];
    final result = Queue<Widget>();
    if (elements.isNotEmpty) {
      if (elements.length != 1) {
        final length = elements.length;
        for (var n = 0; n < length - 1; n++) {
          final e = elements.elementAt(n);
          result.add(e);
          if (this.divider != null) {
            result.add(this.divider!);
          }
        }
        final last = elements.last;
        result.add(last);
      } else {
        final first = elements.first;
        result.add(first);
      }
      if (this.firstIfNotEmpty != null) {
        result.addFirst(this.firstIfNotEmpty!);
      }
      if (this.lastIfNotEmpty != null) {
        result.addLast(this.lastIfNotEmpty!);
      }
    }

    return result.toList();
  }
}
