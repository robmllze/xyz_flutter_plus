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
class WDialogAOrB extends WDialog {
  //
  //
  //

  final WDialogMakeup? dialogMakeup;
  final WFacade facade;
  final WButtonMakeup? buttonMakeupA, buttonMakeupB;
  final String title, message, labelB, labelA;
  final Future<void> Function()? onTapB, onTapA, onClose;
  final Widget? header;

  //
  //
  //

  WDialogAOrB({
    Key? key,
    this.dialogMakeup,
    this.facade = const WFacade(),
    this.buttonMakeupA,
    this.buttonMakeupB,
    required this.title,
    required this.message,
    required this.labelA,
    required this.labelB,
    this.onClose,
    this.onTapA,
    this.onTapB,
    this.header,
    Future<void> Function(Object? e)? onError,
    bool shouldAutoCloseOnComplete = true,
  }) : super(
          key: key,
          onError: onError,
          shouldCloseOnComplete: shouldAutoCloseOnComplete,
        );

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WDialogAOrB> {
  @override
  Widget build(_) {
    return WDialogBody(
      makeup: this.widget.dialogMakeup,
      facade: this.widget.facade,
      header: this.widget.header,
      onClose: this.widget.onClose != null
          ? () async {
              try {
                await this.widget.onClose?.call();
              } catch (e) {
                await this.widget.onError?.call(e);
              }
              this.widget.completer.complete();
            }
          : null,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: $28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            wHeight40(),
            SelectableText(
              this.widget.title,
              style: this.widget.dialogMakeup?.titleTextStyle,
            ),
            wHeight16(),
            SelectableText(
              this.widget.message,
              style: this.widget.dialogMakeup?.messageTextStyle,
            ),
            wHeight24(),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: WButton.loading(
                    label: this.widget.labelA,
                    expanded: true,
                    makeup: this.widget.buttonMakeupA,
                    onTap: () async {
                      try {
                        await this.widget.onTapA?.call();
                      } catch (e) {
                        await this.widget.onError?.call(e);
                      }
                      this.widget.completer.complete();
                    },
                  ),
                ),
                wWidth12(),
                Expanded(
                  flex: 4,
                  child: WButton.loading(
                    label: this.widget.labelB,
                    expanded: true,
                    makeup: this.widget.buttonMakeupB,
                    onTap: () async {
                      try {
                        await this.widget.onTapB?.call();
                      } catch (e) {
                        await this.widget.onError?.call(e);
                      }
                      this.widget.completer.complete();
                    },
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),
            wHeight16(),
          ],
        ),
      ),
    );
  }
}
