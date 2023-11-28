//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Shared
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:async';

import '/all.dart';

part '_snack_bar_manager_makeup.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const SNACK_BAR_MANAGER_PARAMETERS = {
  "actionTextStyle": "TextStyle?",
  "backgroundColor": "Color?",
  "bodyTextStyle": "TextStyle?",
  "borderRadius": "BorderRadius?",
  "icon": "Icon?",
  "loaderMakeup": "WLoaderMakeup?",
  "shadow": "List<BoxShadow>?",
};

@GenerateMakeups(parameters: SNACK_BAR_MANAGER_PARAMETERS)
class SnackBarManager {
  //
  //
  //

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  //
  //
  //

  SnackBarManager(this.scaffoldMessengerKey);

  //
  //
  //

  FutureOr<void> hide([Duration? delay]) async {
    if (delay != null) {
      await Future.delayed(delay);
    }
    this.scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
  }

  //
  //
  //

  Future<void> show({
    required String text,
    Widget? before,
    Widget? after,
    SnackBarManagerMakeup? makeup,
    Future<void> Function()? process,
  }) async {
    final hasProcess = process != null;
    final snackbar = this._build(
      before: before,
      text: text,
      after: after,
      duration: hasProcess ? null : const Duration(seconds: 3),
      makeup: makeup,
    );
    this.scaffoldMessengerKey.currentState?.showSnackBar(snackbar);
    if (hasProcess) {
      await process();
      this.scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    }
  }

  //
  //
  //

  SnackBar _build({
    Widget? before,
    required String text,
    SnackBarManagerMakeup? makeup,
    Widget? after,
    VoidCallback? onTap,
    Duration? duration,
  }) {
    final before1 = before ?? makeup?.icon;
    return SnackBar(
      content: Container(
        decoration: BoxDecoration(
          color: makeup?.backgroundColor,
          borderRadius: makeup?.borderRadius,
          boxShadow: makeup?.shadow,
        ),
        child: Padding(
          padding: EdgeInsets.all($12),
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                if (before1 != null) ...[
                  before1,
                  SizedBox(width: $12),
                ],
                Expanded(
                  child: Text(
                    text,
                    style: makeup?.bodyTextStyle,
                  ),
                ),
                if (after != null) ...[
                  SizedBox(width: $12),
                  after,
                ],
              ],
            ),
          ),
        ),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0.0,
      duration: duration ?? const Duration(seconds: 365),
      backgroundColor: Colors.transparent,
      margin: EdgeInsets.zero,
    );
  }
}
