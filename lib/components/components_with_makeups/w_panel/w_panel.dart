//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

part '_w_panel_makeup.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const W_PANEL_PARAMETERS = {
  "color": "Color?",
  "padding": "double?",
  "defaultWidth": "double?",
  "defaultHeight": "double?",
  "borderRadius": "BorderRadius?",
  "boxShadow": "List<BoxShadow>?",
};

@GenerateMakeups(parameters: W_PANEL_PARAMETERS)
class WPanel extends StatelessWidget {
  //
  //
  //

  final WPanelMakeup? makeup;
  final Widget? child, option;
  final double? width, height;
  final void Function()? onTap, onTapClose;

  //
  //
  //

  const WPanel({
    Key? key,
    this.makeup,
    this.child,
    this.option,
    this.width,
    this.height,
    this.onTap,
    this.onTapClose,
  }) : super(key: key);

  //
  //
  //

  @override
  Widget build(_) {
    return Stack(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: this.onTap,
          child: Container(
            width: this.width ?? this.makeup?.defaultWidth,
            height: this.height ?? this.makeup?.defaultHeight,
            padding: this.makeup?.padding != null ? EdgeInsets.all(this.makeup!.padding!) : null,
            decoration: BoxDecoration(
              color: this.makeup?.color,
              borderRadius: this.makeup?.borderRadius,
              boxShadow: this.makeup?.boxShadow,
            ),
            child: ClipRRect(
              borderRadius: this.makeup?.borderRadius ?? BorderRadius.zero,
              clipBehavior: Clip.antiAlias,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (child != null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: this.child,
                    ),
                  if (option != null) ...[
                    SizedBox(height: this.makeup?.padding),
                    this.option!,
                  ],
                ],
              ),
            ),
          ),
        ),
        if (this.onTapClose != null)
          Align(
            alignment: Alignment.topRight,
            child: WIconButton(
              icon: SizedBox.square(
                dimension: 2.0 * (this.makeup?.padding ?? 0.0),
                child: Center(
                  child: WIcon(Icons.close),
                ),
              ),
              onTap: this.onTapClose,
            ),
          ),
      ],
    );
  }
}
