//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class PodBuilder<T> extends StatefulWidget {
  //
  //
  //

  final Pod<T>? pod;
  final Widget Function(BuildContext, T?) builder;

  //
  //
  //

  const PodBuilder({
    Key? key,
    this.pod,
    required this.builder,
  }) : super(key: key);

  //
  //
  //

  @override
  _State<T> createState() => _State<T>();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State<T> extends State<PodBuilder<T>> {
  //
  //
  //

  @override
  void initState() {
    super.initState();
    this.widget.pod?.addListener(this._update);
  }

  //
  //
  //

  void _update() {
    if (mounted) {
      this.setState(() {});
    }
  }

  //
  //
  //

  @override
  Widget build(final context) {
    return this.widget.builder(context, this.widget.pod?.value);
  }

  //
  //
  //

  @override
  void dispose() {
    this.widget.pod?.removeListener(this._update);
    super.dispose();
  }
}
