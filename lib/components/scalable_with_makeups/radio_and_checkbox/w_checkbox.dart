//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WCheckbox extends StatefulWidget {
  //
  //
  //

  final WRadioMakeup? makeup;
  final Pod pValue;
  final Pod<bool>? pEnabled;
  final List<Widget> children;
  final void Function(bool)? onTap;
  final WCheckboxType type;

  //
  //
  //

  const WCheckbox({
    Key? key,
    this.makeup,
    required this.pValue,
    this.pEnabled,
    this.children = const [],
    this.onTap,
    this.type = WCheckboxType.CHECKBOX,
  }) : super(key: key);

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum WCheckboxType {
  CHECKBOX,
  RADIO,
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WCheckbox> {
  //
  //
  //

  @override
  void dispose() {
    this.widget.pEnabled?.disposeIfTemp();
    this.widget.pValue.disposeIfTemp();
    super.dispose();
  }

  //
  //
  //

  void _onTap() {
    print("Tapping");
    final enabled = this.widget.pEnabled?.value != false;
    if (enabled) {
      final a = this.widget.pValue.value != true;
      this.widget.pValue.set(a);
      this.widget.onTap?.call(a);
    }
  }

  //
  //
  //

  @override
  Widget build(_) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: _onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (this.widget.makeup?.isChildrenBefore == true)
            ...[
              this.widget.makeup?.spacer,
              Expanded(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: this.widget.children,
                ),
              ),
            ].nonNulls,
          MultiPodBuilder(
            pods: Pods(
              podA: this.widget.pValue,
              podB: this.widget.pEnabled,
            ),
            builder: (_, __, final values) {
              final value = values.a == true;
              final enabled = values.b != false;
              switch (this.widget.type) {
                case WCheckboxType.CHECKBOX:
                  return WMaterialCheckbox(
                    value: value,
                    makeup: this.widget.makeup,
                    onChanged: enabled ? (_) => this._onTap() : null,
                  );
                case WCheckboxType.RADIO:
                  return WMaterialRadio(
                    value: value,
                    makeup: this.widget.makeup,
                    onChanged: enabled ? (_) => this._onTap() : null,
                  );
              }
            },
          ),
          if (this.widget.makeup?.isChildrenAfter != true)
            ...[
              this.widget.makeup?.spacer,
              Expanded(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: this.widget.children,
                ),
              ),
            ].nonNulls,
        ],
      ),
    );
  }
}
