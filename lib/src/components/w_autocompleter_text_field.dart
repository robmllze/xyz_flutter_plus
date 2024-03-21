//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// X|Y|Z & Dev
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

export 'package:async/async.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WAutocompleterTextField extends StatefulWidget {
  //
  //
  //

  const WAutocompleterTextField({
    super.key,
    this.getOptions,
    this.getOptionsAsync,
    this.decoration = const InputDecoration(),
    this.style,
    this.optionStyle,
    this.maxOptionsVisible = 5,
  }) : assert(getOptions != null || getOptionsAsync != null);

  //
  //
  //

  final List<String> Function(String)? getOptions;
  final Future<List<String>> Function(String)? getOptionsAsync;
  final InputDecoration decoration;
  final TextStyle? style;
  final TextStyle? optionStyle;
  final int maxOptionsVisible;

  //
  //
  //

  @override
  State<WAutocompleterTextField> createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WAutocompleterTextField> {
  //
  //
  //

  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final _layerLink = LayerLink();
  OverlayEntry? _optionsOverlayEntry;
  CancelableOperation? _cancelableFuture;
  String? _previousText;
  String? _previousNotSelectedText;
  bool _isLoading = false;
  bool _shouldHandleChange = true;
  final _optionHeight = 40.sc;

  //
  //
  //

  @override
  void initState() {
    this._focusNode.addListener(() {
      if (!this._focusNode.hasFocus) {
        this._hideOptionsOverlayEntry();
      }
    });
    this._controller.addListener(
          widget.getOptions != null ? this._onChanged : this._onChangeAsync,
        );
    super.initState();
  }

  //
  //
  //

  @override
  Widget build(_) {
    return CompositedTransformTarget(
      link: this._layerLink,
      child: TextField(
        autocorrect: false,
        focusNode: this._focusNode,
        controller: this._controller,
        decoration: widget.decoration,
        style: widget.style,
      ),
    );
  }

  //
  //
  //

  @override
  void dispose() {
    this._focusNode.dispose();
    this._controller.dispose();
    this._optionsOverlayEntry
      ?..remove()
      ..dispose();
    super.dispose();
  }

  //
  //
  //

  void _onChanged() {
    this._updateUI(widget.getOptions!(this._controller.text));
  }

  //
  //
  //

  void _onChangeAsync() async {
    if (this._controller.text == (this._previousText ?? '')) {
      return;
    }
    this._previousText = this._controller.text;

    if (this._controller.value.selection.start !=
        this._controller.value.selection.end) {
      return;
    }

    if (!this._shouldHandleChange) {
      this._shouldHandleChange = true;
      return;
    }

    if (this._controller.text.isEmpty) {
      this._updateUI();
      return;
    }

    if (this._isLoading) {
      await this._cancelableFuture?.cancel();
    }
    this._isLoading = true;

    this._cancelableFuture = CancelableOperation.fromFuture(
      widget.getOptionsAsync!(this._controller.text),
    );
    this._updateUI(await this._cancelableFuture!.value as List<String>);
    this._isLoading = false;
  }

  //
  //
  //

  void _updateUI([List<String> options = const []]) async {
    if (this._controller.text.isEmpty) {
      this._hideOptionsOverlayEntry();
      this._previousNotSelectedText = null;
      return;
    }

    final notSelectedText = this._controller.text;
    final selection = this._controller.value.selection;

    if (selection.start != selection.end) {
      return;
    }

    if (options.isNotEmpty) {
      if (options.first != this._controller.text) {
        this._showOptionsOverlayEntry(options);

        if (notSelectedText.length >
            (this._previousNotSelectedText?.length ?? 0)) {
          this._controller.value = this._controller.value.copyWith(
                text: options.first,
                selection: selection.copyWith(
                  baseOffset: notSelectedText.length,
                  extentOffset: options.first.length,
                ),
              );
        }
      }
    } else {
      this._hideOptionsOverlayEntry();
    }

    this._previousNotSelectedText = notSelectedText;
  }

  //
  //
  //

  OverlayEntry _createOptionsOverlayEntry(List<String> options) {
    final size = (context.findRenderObject() as RenderBox).size;

    return OverlayEntry(
      builder: (_) => Positioned(
        width: size.width,
        height: this._optionHeight *
                (options.length <= widget.maxOptionsVisible
                    ? options.length
                    : widget.maxOptionsVisible) +
            20.sc,
        child: CompositedTransformFollower(
          link: this._layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 4.sc),
          child: Material(
            elevation: 4.sc,
            child: Scrollbar(
              child: ListView(
                padding: EdgeInsets.only(bottom: 20.sc),
                shrinkWrap: true,
                children: options
                    .map(
                      (e) => GestureDetector(
                        onTap: () => this._onOptionSelect(e),
                        child: SizedBox(
                          height: this._optionHeight,
                          child: ListTile(
                            title: Text(
                              e,
                              style: widget.optionStyle,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //
  //
  //

  void _showOptionsOverlayEntry(List<String> options) {
    this._hideOptionsOverlayEntry();
    this._optionsOverlayEntry = this._createOptionsOverlayEntry(options);
    Overlay.of(context).insert(this._optionsOverlayEntry!);
  }

  //
  //
  //

  void _hideOptionsOverlayEntry() {
    this._optionsOverlayEntry?.remove();
    this._optionsOverlayEntry = null;
  }

  //
  //
  //

  void _onOptionSelect(String text) {
    this._shouldHandleChange = false;
    this._controller.value = TextEditingValue(text: text);
    this._focusNode.unfocus();
  }
}
