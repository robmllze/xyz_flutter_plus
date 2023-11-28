//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

part '_w_radio_makeup.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const W_RADIO_PARAMETERS = {
  "disabledBorderColor": "Color?",
  "disabledSelectedFillColor": "Color?",
  "disabledUnselectedFillColor": "Color?",
  "borderColor": "Color?",
  "selectedFillColor": "Color?",
  "unselectedFillColor": "Color?",
  "borderRadius": "BorderRadius?",
  "borderThickness": "double?",
  "elementStyle": "TextStyle?",
  "errorStyle": "TextStyle?",
  "innerBorderRadius": "BorderRadius?",
  "innerPadding": "EdgeInsets?",
  "isChildrenAfter": "bool?",
  "isChildrenBefore": "bool?",
  "selectedIcon": "Icon?",
  "shape": "BoxShape?",
  "size": "double?",
  "spacer": "SizedBox?",
  "titleBuilder": "Widget? Function(String?)?",
  "titleDotBuilder": "Widget? Function(bool?)?",
};

@GenerateMakeups(parameters: W_RADIO_PARAMETERS)
class WRadio extends StatelessWidget {
  //
  //
  //

  final WRadioMakeup? makeup;
  final bool value;
  final bool enabled;
  final bool error;

  //
  //
  //

  const WRadio({
    super.key,
    this.makeup,
    this.value = false,
    this.enabled = true,
    this.error = false,
  });

  //
  //
  //

  @override
  Widget build(_) {
    final fillColor = this.error
        ? Colors.transparent
        : this.enabled
            ? this.makeup?.selectedFillColor
            : this.makeup?.disabledSelectedFillColor;
    final borderColor = this.error
        ? this.makeup?.errorStyle?.color ?? this.makeup?.borderColor
        : this.enabled
            ? this.makeup?.borderColor
            : this.makeup?.disabledBorderColor;
    final minSize = $20;
    final maxSize = this.makeup?.size != null
        ? (this.makeup!.size! > minSize ? this.makeup!.size! : minSize)
        : double.infinity;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxSize,
        maxHeight: maxSize,
        minWidth: minSize,
        minHeight: minSize,
      ),
      child: LayoutBuilder(
        builder: (_, final constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;
          final smallest = w < h ? w : h;
          return Center(
            child: Container(
              width: smallest,
              height: smallest,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: this.makeup?.shape ?? BoxShape.circle,
                borderRadius:
                    this.makeup?.shape == BoxShape.rectangle ? this.makeup?.borderRadius : null,
                border: Border.all(
                  width: this.makeup?.borderThickness ?? 0.0,
                  color: borderColor ?? Colors.transparent,
                ),
              ),
              child: this.value
                  ? Padding(
                      padding: this.makeup?.innerPadding ?? EdgeInsets.zero,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: this.makeup?.shape == BoxShape.rectangle
                              ? this.makeup?.innerBorderRadius
                              : null,
                          color: fillColor,
                          shape: this.makeup?.shape ?? BoxShape.circle,
                        ),
                        child: Center(child: makeup?.selectedIcon),
                      ),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
