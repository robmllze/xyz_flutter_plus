//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Shared
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@visibleForTesting
class WMaterialCheckbox extends StatelessWidget {
  //
  //
  //

  final WRadioMakeup? makeup;
  final bool value;
  final void Function(bool?)? onChanged;

  //
  //
  //

  const WMaterialCheckbox({
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
              ? value == true
                  ? this.makeup?.selectedFillColor
                  : this.makeup?.unselectedFillColor
              : value == true
                  ? this.makeup?.disabledSelectedFillColor
                  : this.makeup?.disabledUnselectedFillColor) ??
          Colors.black;
    });

    final overlayColor = MaterialStateProperty.resolveWith<Color>((_) => Colors.transparent);
    final checkbox = Checkbox(
      value: value,
      onChanged: this.onChanged,
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
      child: checkbox,
    );
  }
}
