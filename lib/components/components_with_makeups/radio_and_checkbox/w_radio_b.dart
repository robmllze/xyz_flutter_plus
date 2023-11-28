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
    this.widget.pEnabled?.disposeIfRequested();
    this.widget.pErrorText?.disposeIfRequested();
    this.widget.pValue.disposeIfRequested();
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
        if (this.widget.pEnabled?.valueAs() != false) {
          final a = !this.widget.pValue.valueAs();
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
            child: Consumer(
              builder: (_, final ref, __) {
                final value = this.widget.pValue.watch(ref);
                final enabled = this.widget.pEnabled?.watch(ref) != false;
                final errorText = this.widget.pErrorText?.watch(ref);
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
