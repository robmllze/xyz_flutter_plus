//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WRadioA extends StatefulWidget {
  //
  //
  //

  final WRadioMakeup? makeup;
  final bool initial;
  final Widget? child;
  final void Function(bool)? onTap;

  //
  //
  //

  const WRadioA({
    Key? key,
    this.makeup,
    this.initial = false,
    this.child,
    this.onTap,
  }) : super(key: key);

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WRadioA> {
  //
  //
  //

  late bool _value = this.widget.initial;

  //
  //
  //

  @override
  Widget build(_) {
    return GestureDetector(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          SizedBox.square(
            dimension: this.widget.makeup?.size,
            child: WRadio(
              value: this._value,
              makeup: this.widget.makeup,
            ),
          ),
          wWidth12(),
          SizedBox(child: this.widget.child),
        ],
      ),
      onTap: () {
        this.setState(() => this._value = !this._value);
        this.widget.onTap?.call(this._value);
      },
    );
  }
}
