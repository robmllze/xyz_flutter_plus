//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: must_be_immutable

import '/all.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// ...
class WDialogLoading extends WDialog {
  //
  //
  //

  final WDialogMakeup? dialogMakeup;
  final WLoaderMakeup? loaderMakeup;
  final WFacade facade;
  final String title, message;
  final Future<void> Function()? loadingBody;
  final Widget? header;

  //
  //
  //

  WDialogLoading({
    Key? key,
    this.dialogMakeup,
    this.loaderMakeup,
    this.facade = const WFacade(),
    required this.title,
    required this.message,
    this.loadingBody,
    this.header,
    Future<void> Function(Object? e)? onError,
    bool shouldCloseOnComplete = false,
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

class _State extends State<WDialogLoading> {
  @override
  Widget build(_) {
    return WDialogBody(
      makeup: this.widget.dialogMakeup,
      facade: this.widget.facade,
      header: this.widget.header,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: $32, vertical: $48),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WFutureLoader(
              future: () async {
                try {
                  await this.widget.loadingBody?.call();
                } catch (e) {
                  await this.widget.onError?.call(e);
                }
                this.widget.completer.complete();
              }(),
            ),
            wWidth16(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    this.widget.title,
                    style: this.widget.dialogMakeup?.titleTextStyle,
                  ),
                  wHeight4(),
                  SelectableText(
                    this.widget.message,
                    style: this.widget.dialogMakeup?.messageTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
