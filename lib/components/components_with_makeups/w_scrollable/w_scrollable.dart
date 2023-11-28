//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

part '_w_scrollable_makeup.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const W_SCROLLABLE_PARAMETERS = {
  "insidePadding": "EdgeInsets?",
  "thumbVisibility": "bool?",
  "outsidePadding": "EdgeInsets?",
  "style": "WScrollbarStyle?",
};

@GenerateMakeups(parameters: W_SCROLLABLE_PARAMETERS)
class WScrollable extends StatefulWidget {
  //
  //
  //

  final WScrollableMakeup? makeup;
  final Widget child;
  final Axis axis;
  final ScrollController controller;
  final bool reverse;
  final void Function()? onEdgeMin, onEdgeMax;

  //
  //
  //

  WScrollable({
    Key? key,
    this.makeup,
    required this.child,
    this.axis = Axis.vertical,
    this.reverse = false,
    ScrollController? controller,
    this.onEdgeMin,
    this.onEdgeMax,
  })  : this.controller = controller ?? ScrollController(),
        super(key: key);

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WScrollable> {
  //
  //
  //

  bool _onEdge = false;

  //
  //
  //

  @override
  void initState() {
    this.widget.controller.addListener(this._listener);
    super.initState();
  }

  //
  //
  //

  @override
  void dispose() {
    this.widget.controller.removeListener(this._listener);
    super.dispose();
  }

  //
  //
  //

  void _listener() {
    final position = this.widget.controller.position;
    if (position.pixels <= position.minScrollExtent) {
      if (!this._onEdge) {
        this.widget.onEdgeMin?.call();
      }
      this._onEdge = true;
    } else if (position.pixels >= position.maxScrollExtent) {
      if (!this._onEdge) {
        this.widget.onEdgeMax?.call();
      }
      this._onEdge = true;
    } else {
      this._onEdge = false;
    }
  }

  //
  //
  //

  @override
  Widget build(_) {
    return Padding(
      padding: this.widget.makeup?.outsidePadding ?? EdgeInsets.zero,
      child: WScrollbar(
        controller: this.widget.controller,
        thumbVisibility: this.widget.makeup?.thumbVisibility,
        style: this.widget.makeup?.style ?? const WScrollbarStyle(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: this.widget.axis,
          controller: this.widget.controller,
          reverse: this.widget.reverse,
          child: Padding(
            padding: this.widget.makeup?.insidePadding ?? EdgeInsets.zero,
            child: this.widget.child,
          ),
        ),
      ),
    );
  }
}
