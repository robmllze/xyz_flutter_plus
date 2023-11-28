//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Shared
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: must_be_immutable

import '/all.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// ...
class WDialogOkay extends WDialog {
  //
  //
  //

  final WDialogMakeup? dialogMakeup;
  final WButtonMakeup? buttonMakeup;
  final WFacade facade;
  final String title, message;
  final String? labelOkay;
  final Future<void> Function()? onTapOkay, onClose;

  //
  //
  //

  WDialogOkay({
    Key? key,
    this.dialogMakeup,
    this.buttonMakeup,
    this.facade = const WFacade(),
    required this.title,
    required this.message,
    this.labelOkay,
    this.onTapOkay,
    this.onClose,
    Future<void> Function(Object? e)? onError,
    bool shouldCloseOnComplete = true,
  }) : super(
          key: key,
          onError: onError,
          shouldCloseOnComplete: shouldCloseOnComplete,
        );

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WDialogOkay> {
  @override
  Widget build(_) {
    final onClose = this.widget.onClose;
    return WDialogBody(
      makeup: this.widget.dialogMakeup,
      facade: this.widget.facade,
      header: SelectableText(
        this.widget.title,
        style: this.widget.dialogMakeup?.titleTextStyle,
      ),
      onClose: onClose != null
          ? () async {
              try {
                await onClose.call();
              } catch (e) {
                await this.widget.onError?.call(e);
              }
              this.widget.completer.complete();
            }
          : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            this.widget.message,
            style: this.widget.dialogMakeup?.messageTextStyle,
          ),
          wHeight20(),
          if (this.widget.labelOkay != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                WButton.loading(
                  label: this.widget.labelOkay!,
                  makeup: this.widget.buttonMakeup,
                  onTap: () async {
                    try {
                      await this.widget.onTapOkay?.call();
                    } catch (e) {
                      await this.widget.onError?.call(e);
                    }
                    this.widget.completer.complete();
                  },
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
