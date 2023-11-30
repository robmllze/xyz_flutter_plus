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
    return PodBuilder.multi(
      pods: [
        this.widget.pValue,
        this.widget.pEnabled,
      ],
      builder: (_, final values) {
        final [value, enabled0] = values;
        final enabled = enabled0 != false;
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
                    onTap: enabled ? this.widget.onPressedAdd : null,
                    child: Padding(
                      padding: EdgeInsets.all($12),
                      child: WIcon(
                        Icons.add,
                        makeup: enabled
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
                  style: enabled
                      ? this.widget.makeup?.textStyleItem
                      : this.widget.makeup?.textStyleItemDisabled,
                ),
                onTap: enabled
                    ? () {
                        this.widget.onPressed?.call(value);
                      }
                    : null,
                onTapSecond: enabled
                    ? () {
                        this.widget.onPressedDelete?.call(value);
                      }
                    : null,
                secondIcon: WIcon(
                  Icons.delete,
                  makeup: enabled
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
