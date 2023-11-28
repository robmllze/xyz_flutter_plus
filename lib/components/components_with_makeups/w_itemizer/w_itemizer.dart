//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

part '_w_itemizer_makeup.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const W_ITEMIZER_PARAMETERS = {
  "makeupIconAdd": "WIconMakeup?",
  "makeupIconAddDisabled": "WIconMakeup?",
  "makeupIconDelete": "WIconMakeup?",
  "makeupIconDeleteDisabled": "WIconMakeup?",
  "textStyleItem": "TextStyle?",
  "textStyleItemDisabled": "TextStyle?",
};

@GenerateMakeups(parameters: W_ITEMIZER_PARAMETERS)
class WItemizer extends WField {
  //
  //
  //

  final WItemizerMakeup? makeup;
  final Widget title;
  final void Function(String value)? onPressed, onPressedDelete;
  final void Function()? onPressedAdd;

  //
  //
  //

  const WItemizer({
    Key? key,
    this.makeup,
    required super.pValue,
    super.pEnabled,
    required this.title,
    this.onPressed,
    this.onPressedDelete,
    this.onPressedAdd,
  }) : super(key: key);

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State<T> extends WFieldState<WItemizer> {
  //
  //
  //

  @override
  Widget build(_) {
    return Consumer(
      builder: (_, final ref, __) {
        final value = this.widget.pValue.watch(ref);
        final isEnabled = this.widget.pEnabled?.watch(ref) != false;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                this.widget.title,
                const Spacer(),
                if (this.widget.onPressedAdd != null)
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: isEnabled ? this.widget.onPressedAdd : null,
                    child: Padding(
                      padding: EdgeInsets.all($12),
                      child: WIcon(
                        Icons.add,
                        makeup: isEnabled
                            ? this.widget.makeup?.makeupIconAdd
                            : this.widget.makeup?.makeupIconAddDisabled,
                      ),
                    ),
                  ),
              ],
            ),
            wHeight16(),
            ...value.map((final value) {
              return WAction(
                first: Text(
                  value,
                  style: isEnabled
                      ? this.widget.makeup?.textStyleItem
                      : this.widget.makeup?.textStyleItemDisabled,
                ),
                onTap: isEnabled
                    ? () {
                        this.widget.onPressed?.call(value);
                      }
                    : null,
                onTapSecond: isEnabled
                    ? () {
                        this.widget.onPressedDelete?.call(value);
                      }
                    : null,
                secondIcon: WIcon(
                  Icons.delete,
                  makeup: isEnabled
                      ? this.widget.makeup?.makeupIconDelete
                      : this.widget.makeup?.makeupIconDeleteDisabled,
                ),
              );
            }),
          ],
        );
      },
    );
  }
}
