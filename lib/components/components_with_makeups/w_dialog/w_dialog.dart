//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: must_be_immutable

import '/all.dart';

import 'dart:async';

part '_w_dialog_makeup.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const W_DIALOG_PARAMETERS = {
  "closeIconMakeup": "WIconMakeup?",
  "decoration": "BoxDecoration?",
  "maxHeight": "double?",
  "maxWidth": "double?",
  "messageTextStyle": "TextStyle?",
  "overlayColor": "Color?",
  "titleTextStyle": "TextStyle?",
};

@GenerateMakeups(parameters: W_DIALOG_PARAMETERS)
abstract class WDialog extends StatefulWidget {
  //
  //
  //

  final completer = Completer<void>();
  Future<void> Function(Object? e)? onError;
  final bool shouldCloseOnComplete;

  //
  //
  //

  WDialog({
    required Key? key,
    required this.onError,
    required this.shouldCloseOnComplete,
  }) : super(key: key);
}
