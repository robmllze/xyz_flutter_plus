//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

import 'package:xyz_pod/xyz_pod.dart';

part '_w_switcher_makeup.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const W_SWITCHER_PARAMETERS = {
  "isChildrenBefore": "bool?",
  "trackColor": "MaterialStateProperty<Color>?",
  "overlayColor": "MaterialStateProperty<Color>?",
  "thumbColor": "MaterialStateProperty<Color>?",
  "spacer": "Widget?",
};

@GenerateMakeups(parameters: W_SWITCHER_PARAMETERS)
class WSwitcher extends WField {
  //
  //
  //

  final WSwitcherMakeup? makeup;
  final List<Widget> children;
  final void Function(bool)? onChanged;

  //
  //
  //

  const WSwitcher({
    super.key,
    this.makeup,
    required super.pValue,
    super.pEnabled,
    this.children = const [],
    this.onChanged,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends WFieldState<WSwitcher> {
  //
  //
  //

  @override
  Widget build(_) {
    return MultiPodBuilder(
      pods: Pods(
        podA: this.widget.pValue,
        podB: this.widget.pEnabled,
      ),
      builder: (_, final values) {
        final value = values.a;
        final enabled = values.b;
        final onTap = enabled != false
            ? ([_]) async {
                await this.widget.pValue.set(!value);
                final newValue = this.widget.pValue.value;
                this.widget.onChanged?.call(newValue);
              }
            : null;
        return GestureDetector(
          onTap: onTap,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              if (this.widget.makeup?.isChildrenBefore == true) ...[
                ...this.widget.children,
                if (this.widget.makeup?.spacer != null) this.widget.makeup!.spacer!,
              ],
              Switch(
                value: value,
                trackColor: this.widget.makeup?.trackColor,
                overlayColor: this.widget.makeup?.overlayColor,
                thumbColor: this.widget.makeup?.thumbColor,
                onChanged: onTap,
              ),
              if (this.widget.makeup?.isChildrenBefore != true) ...[
                if (this.widget.makeup?.spacer != null) this.widget.makeup!.spacer!,
                ...this.widget.children,
              ],
            ],
          ),
        );
      },
    );
  }
}
