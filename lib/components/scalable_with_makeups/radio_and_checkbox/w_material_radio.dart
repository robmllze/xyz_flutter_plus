//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@visibleForTesting
class WMaterialRadio extends StatelessWidget {
  //
  //
  //

  final WRadioMakeup? makeup;
  final bool value;
  final void Function(bool?)? onChanged;

  //
  //
  //

  const WMaterialRadio({
    this.makeup,
    Key? key,
    this.value = false,
    this.onChanged,
  }) : super(key: key);

  //
  //
  //

  @override
  Widget build(_) {
    final fillColor = MaterialStateProperty.resolveWith<Color>((_) {
      return (this.onChanged != null
              ? this.value == true
                  ? this.makeup?.selectedFillColor
                  : this.makeup?.unselectedFillColor
              : this.value == true
                  ? this.makeup?.disabledSelectedFillColor
                  : this.makeup?.disabledUnselectedFillColor) ??
          Colors.black;
    });
    final overlayColor = MaterialStateProperty.resolveWith<Color>((_) => Colors.transparent);
    final radio = Radio<bool>(
      toggleable: true,
      value: true,
      onChanged: this.onChanged,
      groupValue: value,
      fillColor: fillColor,
      overlayColor: overlayColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
    );
    return SizedBox.square(
      dimension: this.makeup?.size,
      child: radio,
    );
  }
}
