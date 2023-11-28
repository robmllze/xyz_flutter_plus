//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

part '_w_dot_makeup.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const W_DOT_PARAMETERS = {
  "textStyle": "TextStyle?",
  "backgroundColor": "Color?",
  "height": "double?",
  "addedWidth": "double?",
  "border": "Border?",
  "shadow": "List<BoxShadow>?",
};

@GenerateMakeups(parameters: W_DOT_PARAMETERS)
class WDot extends StatelessWidget {
  //
  //
  //

  final String? text;
  final WDotMakeup? makeup;

  //
  //
  //

  const WDot({
    super.key,
    this.makeup,
    this.text,
  });

  //
  //
  //

  @override
  Widget build(_) {
    final height = this.makeup?.height ?? 0.0;
    return Container(
      constraints: BoxConstraints(minWidth: height),
      height: height,
      decoration: BoxDecoration(
        color: this.makeup?.backgroundColor,
        border: this.makeup?.border,
        borderRadius: BorderRadius.circular(0.5 * height),
        boxShadow: this.makeup?.shadow,
      ),
      child: IntrinsicWidth(
        child: this.text?.isNotEmpty == true
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: this.makeup?.addedWidth ?? 0.0),
                child: Center(
                  child: Text(
                    this.text!,
                    style: this.makeup?.textStyle?.copyWith(),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
