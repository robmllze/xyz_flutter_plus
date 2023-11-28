//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

part '_w_chip_makeup.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const W_CHIP_PARAMETERS = {
  "textStyleBuilder": "TextStyle? Function(WChipOptions)?",
  "decorationBuilder": "BoxDecoration? Function(WChipOptions)?",
  "borderRadius": "BorderRadius?",
  "colorSelected": "Color?",
  "colorSelectedDisabled": "Color?",
  "colorUnselected": "Color?",
  "colorUnselectedDisabled": "Color?",
  "padding": "EdgeInsets?",
  "textStyleSelected": "TextStyle?",
  "textStyleSelectedDisabled": "TextStyle?",
  "textStyleUnselected": "TextStyle?",
  "textStyleUnselectedDisabled": "TextStyle?",
};

@GenerateMakeups(parameters: W_CHIP_PARAMETERS)
class WChip extends StatelessWidget {
  //
  //
  //

  final WChipMakeup? makeup;
  final String label;
  final WChipOptions options;
  final void Function()? onTap;

  //
  //
  //

  const WChip({
    super.key,
    this.makeup,
    this.label = "WChip",
    this.options = const WChipOptions(),
    this.onTap,
  });

  //
  //
  //

  @override
  Widget build(_) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        decoration: this.makeup?.decorationBuilder?.call(this.options),
        padding: this.makeup?.padding,
        // The IntrinsicWidth widget ensures that each chip has a minimum width
        // that fits its content, while maintaining a consistent width across
        // all chips.
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                this.label,
                style: this.makeup?.textStyleBuilder?.call(this.options),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WChipOptions {
  final bool enabled;
  final bool selected;
  const WChipOptions({
    this.enabled = true,
    this.selected = false,
  });
}
