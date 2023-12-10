//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WRadioB extends StatefulWidget {
  //
  //
  //

  final WRadioMakeup? makeup;
  final Pod<bool> pValue;
  final Pod<bool>? pEnabled;
  final Pod<String?>? pErrorText;
  final List<Widget> children;
  final void Function(bool)? onTap;

  //
  //
  //

  const WRadioB({
    Key? key,
    this.makeup,
    required this.pValue,
    this.pEnabled,
    this.pErrorText,
    this.children = const [],
    this.onTap,
  }) : super(key: key);

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WRadioB> {
  //
  //
  //

  @override
  void dispose() {
    this.widget.pEnabled?.disposeIfMarkedAsTemp();
    this.widget.pErrorText?.disposeIfMarkedAsTemp();
    this.widget.pValue.disposeIfMarkedAsTemp();
    super.dispose();
  }

  //
  //
  //

  @override
  Widget build(_) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (this.widget.pEnabled?.value != false) {
          final a = !this.widget.pValue.value;
          this.widget.pValue.set(a);
          this.widget.onTap?.call(a);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (this.widget.makeup?.isChildrenBefore == true)
            ...[
              ...this.widget.children,
              this.widget.makeup?.spacer,
            ].nonNulls,
          SizedBox.square(
            dimension: this.widget.makeup?.size,
            child: PodListBuilder(
              pods: [
                this.widget.pValue,
                this.widget.pEnabled,
                this.widget.pErrorText,
              ],
              builder: (final values) {
                final value = values[0] == true;
                final enabled = values[1] != false;
                final errorText = values[2];
                final error = errorText != null;
                return WRadio(
                  value: value,
                  makeup: this.widget.makeup,
                  enabled: enabled,
                  error: error,
                );
              },
            ),
          ),
          if (this.widget.makeup?.isChildrenAfter != true)
            ...[
              this.widget.makeup?.spacer,
              ...this.widget.children,
            ].nonNulls,
        ],
      ),
    );
  }
}
