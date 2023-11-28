//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

part '_w_ribbon_makeup.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const W_RIBBON_PARAMETERS = {
  "color": "Color?",
  "textStyle": "TextStyle?",
  "borderRadius": "BorderRadius?",
  "padding": "EdgeInsets?",
  "icon": "Widget?",
};

@GenerateMakeups(parameters: W_RIBBON_PARAMETERS)
class WRibbon extends StatelessWidget {
  //
  //
  //

  final WRibbonMakeup? makeup;
  final String? text;
  final Widget? child;
  final double width;

  //
  //
  //

  const WRibbon({
    super.key,
    required this.makeup,
    this.text,
    this.child,
    this.width = double.infinity,
  });

  //
  //
  //

  @override
  Widget build(_) {
    return Container(
      decoration: BoxDecoration(
        color: this.makeup?.color,
        borderRadius: this.makeup?.borderRadius,
      ),
      child: Padding(
        padding: this.makeup?.padding ?? EdgeInsets.zero,
        child: SizedBox(
          width: this.width,
          child: Row(
            children: [
              if (this.makeup?.icon != null) this.makeup!.icon!,
              if (this.text != null)
                Expanded(
                  child: Text(
                    text!,
                    style: this.makeup?.textStyle,
                  ),
                ),
              if (this.child != null)
                Expanded(
                  child: child!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
