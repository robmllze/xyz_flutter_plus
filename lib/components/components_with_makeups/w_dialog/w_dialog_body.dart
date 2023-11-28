//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Shared
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WDialogBody extends StatefulWidget {
  //
  //
  //

  final WDialogMakeup? makeup;
  final Widget child;
  final WFacade facade;
  final Widget? header;
  final Future<void> Function()? onClose;

  //
  //
  //

  const WDialogBody({
    Key? key,
    this.makeup,
    required this.child,
    this.facade = const WFacade(),
    this.header,
    this.onClose,
  }) : super(key: key);

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WDialogBody> {
  @override
  Widget build(_) {
    final header = this.widget.header;
    final onClose = this.widget.onClose;
    return Material(
      color: Colors.transparent,
      child: this
          .widget
          .facade
          .copyWith(
            child: Container(
              color: this.widget.makeup?.overlayColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all($16),
                    child: Container(
                      decoration: this.widget.makeup?.decoration,
                      constraints: BoxConstraints(
                        maxWidth: this.widget.makeup?.maxWidth ?? double.infinity,
                        maxHeight: this.widget.makeup?.maxHeight ?? double.infinity,
                      ),
                      child: Stack(
                        alignment: Alignment.topRight,
                        fit: StackFit.passthrough,
                        children: [
                          ClipRRect(
                            borderRadius:
                                this.widget.makeup?.decoration?.borderRadius ?? BorderRadius.zero,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (header != null) ...[
                                    header,
                                    wHeight16(),
                                  ],
                                  this.widget.child,
                                ],
                              ),
                            ),
                          ),
                          if (onClose != null)
                            WIconButton(
                              icon: Padding(
                                padding: EdgeInsets.all($12),
                                child: WIcon(Icons.close),
                              ),
                              onTap: onClose,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .draw(),
    );
  }
}
