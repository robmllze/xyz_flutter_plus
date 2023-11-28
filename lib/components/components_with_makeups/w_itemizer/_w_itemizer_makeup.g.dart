//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED BY XYZ_GEN - DO NOT MODIFY BY HAND
// See: https://github.com/robmllze/xyz_gen
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

part of 'w_itemizer.dart'; // part '_w_itemizer_makeup.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WItemizerMakeup {
  //
  //
  //

  WIconMakeup? makeupIconAdd;
  WIconMakeup? makeupIconAddDisabled;
  WIconMakeup? makeupIconDelete;
  WIconMakeup? makeupIconDeleteDisabled;
  TextStyle? textStyleItem;
  TextStyle? textStyleItemDisabled;

  //
  //
  //

  WItemizerMakeup({
    this.makeupIconAdd,
    this.makeupIconAddDisabled,
    this.makeupIconDelete,
    this.makeupIconDeleteDisabled,
    this.textStyleItem,
    this.textStyleItemDisabled,
  });

  //
  //
  //

  WItemizerMakeup copyWith({
    WIconMakeup? makeupIconAdd,
    WIconMakeup? makeupIconAddDisabled,
    WIconMakeup? makeupIconDelete,
    WIconMakeup? makeupIconDeleteDisabled,
    TextStyle? textStyleItem,
    TextStyle? textStyleItemDisabled,
  }) {
    return WItemizerMakeup(
      makeupIconAdd: makeupIconAdd ?? this.makeupIconAdd,
      makeupIconAddDisabled:
          makeupIconAddDisabled ?? this.makeupIconAddDisabled,
      makeupIconDelete: makeupIconDelete ?? this.makeupIconDelete,
      makeupIconDeleteDisabled:
          makeupIconDeleteDisabled ?? this.makeupIconDeleteDisabled,
      textStyleItem: textStyleItem ?? this.textStyleItem,
      textStyleItemDisabled:
          textStyleItemDisabled ?? this.textStyleItemDisabled,
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef FWItemizerMakeup = WItemizerMakeup Function();
