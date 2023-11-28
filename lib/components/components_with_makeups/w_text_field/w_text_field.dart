//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Shared
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/cupertino.dart' show CupertinoTextSelectionControls;
import 'package:flutter/services.dart';

import '/all.dart';

part '_w_text_field_makeup.g.dart';

typedef TWTextFieldMakeupFilter = WTextFieldMakeup? Function(WTextFieldEvent);

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const W_TEXT_FIELD_PARAMETERS = {
  "cursorColor": "Color?",
  "decoration": "BoxDecoration?",
  "disabledErrorMakeupFilter": "TWTextFieldMakeupFilter?",
  "disabledMakeupFilter": "TWTextFieldMakeupFilter?",
  "errorBuilder": "Widget? Function(WTextFieldEvent)?",
  "errorMakeupFilter": "TWTextFieldMakeupFilter?",
  "expands": "bool?",
  "finalMakeupFilter": "TWTextFieldMakeupFilter?",
  "hintBuilder": "Widget? Function(WTextFieldEvent)?",
  "inputFormatters": "List<TextInputFormatter>?",
  "insidePadding": "EdgeInsets?",
  "keyboardType": "TextInputType?",
  "leftWidgetBuilder": "Widget? Function(WTextFieldEvent)?",
  "maxLines": "int?",
  "minLines": "int?",
  "outsidePadding": "EdgeInsets?",
  "rightWidgetBuilder": "Widget? Function(WTextFieldEvent)?",
  "selectionColor": "Color?",
  "textAlign": "TextAlign?",
  "textStyle": "TextStyle?",
  "titleBuilder": "Widget? Function(WTextFieldEvent)?",
  "titleDotBuilder": "Widget? Function(WTextFieldEvent)?",
};

@GenerateMakeups(parameters: W_TEXT_FIELD_PARAMETERS)
class WTextField extends WField {
  //
  //
  //

  final WTextFieldMakeup? makeup;
  final Pod<String>? pHint;
  final Pod<List<String>>? pAutoFillHints;
  final FocusNode? focusNode;
  final void Function(WTextFieldEvent)? onChanged;
  final void Function(WTextFieldEvent)? onChangedDelayed;
  final void Function(WTextFieldEvent)? onSubmitted;
  final void Function(WTextFieldEvent)? onTapInside;
  final void Function(WTextFieldEvent)? onTapOutside;
  final Duration onChangedDelay;
  final bool autofocus;

  //
  //
  //

  const WTextField({
    super.key,
    this.makeup,
    this.pHint,
    this.pAutoFillHints,
    required super.pValue,
    super.pEnabled,
    super.pErrorText,
    super.pObscured,
    super.pReadOnly,
    super.pTitle,
    super.pShowTitleDot,
    this.autofocus = false,
    this.focusNode,
    this.onChanged,
    this.onChangedDelay = const Duration(seconds: 2),
    this.onChangedDelayed,
    this.onSubmitted,
    this.onTapInside,
    this.onTapOutside,
  });

  //
  //
  //

  @override
  WTextFieldState createState() => WTextFieldState();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WTextFieldState extends WFieldState<WTextField> {
  //
  //
  //

  late final Pod<bool> pHasFocus;
  late final pHint = this.widget.pHint;
  late final pAutoFillHints = this.widget.pAutoFillHints;
  //late final _makeup = this.widget.makeup;
  late final controller = TextEditingController();
  var baseOffset = 0;
  late final focusNode = this.widget.focusNode ?? FocusNode();
  final selectionControls = CurrentPlatform.isOsApple
      ? CupertinoTextSelectionControls()
      : MaterialTextSelectionControls();
  late WTextFieldEvent event;

  //
  //
  //

  @override
  void initState() {
    if (this.widget.autofocus) this.focusNode.requestFocus();
    this.pHasFocus = Pod<bool>(this.focusNode.hasFocus);
    this.focusNode.addListener(this.onFocusChanged);
    super.initState();
  }

  //
  //
  //

  @override
  void dispose() {
    this.focusNode.removeListener(this.onFocusChanged);
    this.pHasFocus.dispose();
    this.controller.dispose();
    this.pHint?.disposeIfRequested();
    this.pAutoFillHints?.disposeIfRequested();
    this._onChangedDebouncer?.finalize();
    super.dispose();
  }

  //
  //
  //

  @override
  void onChangedValue(final value) {
    final text = value?.toString() ?? "";
    final selection = TextSelection.collapsed(offset: text.length);
    this.controller.value = this.controller.value.copyWith(text: text, selection: selection);
  }

  //
  //
  //

  Future<void> onFocusChanged() async {
    await this.pHasFocus.set(this.focusNode.hasFocus);
  }

  //
  //
  //

  void onTapOutside(PointerDownEvent event) {
    this.widget.onTapOutside?.call(this.event);
  }

  //
  //
  //

  void onChanged(String value) async {
    await this.pValue.set(value, includeCallbackKeys: {});
    this.controller.selection = TextSelection.collapsed(offset: this.baseOffset);
    this.widget.onChanged?.call(this.event);
    this._onChangedDebouncer?.call();
  }

  //
  //
  //

  late final _onChangedDebouncer = this.widget.onChangedDelayed != null
      ? Debouncer(
          delay: this.widget.onChangedDelay,
          onWaited: () {
            this.widget.onChangedDelayed!(this.event);
          },
        )
      : null;

  //
  //
  //

  void onSelectionChanged(TextSelection selection, SelectionChangedCause? cause) {
    this.baseOffset = selection.baseOffset;
    this.widget.onTapInside?.call(this.event);
  }

  //
  //
  //

  void onSubmitted(_) {
    this.focusNode.unfocus();
    this.widget.onSubmitted?.call(this.event);
  }

  //
  //
  //

  @override
  Widget build(_) {
    final cursorWidth = 1.5.scaled;
    final scrollPadding = EdgeInsets.all($20);
    return Consumer(
      builder: (_, final ref, __) {
        final text = super.pValue.watch(ref)?.toString() ?? "";
        final title = super.pTitle?.watch(ref);
        final showTitleDot = this.widget.pShowTitleDot?.watch(ref) == true;
        final enabled = super.pEnabled?.watch(ref) ?? true;
        final readOnly = (super.pReadOnly?.watch(ref) ?? false) || !enabled;
        final obscured = super.pObscured?.watch(ref) ?? false;
        final hint = this.pHint?.watch(ref);
        final error = this.pErrorText?.watch(ref);
        final hasError = error != null;
        final hasFocus = this.pHasFocus.watch(ref);
        final autoFillHints = this.pAutoFillHints?.watch(ref) ?? [];
        this.event = WTextFieldEvent(
          makeup: this.widget.makeup,
          state: this,
          text: text,
          hasFocus: hasFocus,
          showTitleDot: showTitleDot,
          hasError: hasError,
          enabled: enabled,
          readOnly: readOnly,
          obscured: obscured,
          hint: hint,
          error: error,
          autoFillHints: autoFillHints,
        );
        var activeMakeup = (enabled
                ? (hasError ? this.widget.makeup?.errorMakeupFilter?.call(this.event) : this.widget.makeup)
                : (hasError
                    ? this.widget.makeup?.disabledErrorMakeupFilter?.call(this.event)
                    : this.widget.makeup?.disabledMakeupFilter?.call(this.event))) ??
            this.widget.makeup;
        final activeEvent = this.event.copyWith(makeup: activeMakeup);
        activeMakeup = this.widget.makeup?.finalMakeupFilter?.call(activeEvent) ?? activeMakeup;
        final titleBuilder = activeMakeup?.titleBuilder;
        final titleDotBuilder = activeMakeup?.titleDotBuilder;
        final leftWidgetBuilder = activeMakeup?.leftWidgetBuilder;
        final rightWidgetBuilder = activeMakeup?.rightWidgetBuilder;
        final hintBuilder = activeMakeup?.hintBuilder;
        final errorBuilder = activeMakeup?.errorBuilder;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null && title.isNotEmpty)
                  SizedBox(child: titleBuilder?.call(this.event)),
                if (showTitleDot) SizedBox(child: titleDotBuilder?.call(this.event)),
              ],
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTapDown: (_) {
                this.focusNode.requestFocus();
                this.widget.onTapInside?.call(this.event);
              },
              child: Container(
                padding: activeMakeup?.outsidePadding,
                decoration: activeMakeup?.decoration,
                child: Row(
                  children: [
                    SizedBox(child: leftWidgetBuilder?.call(this.event)),
                    Expanded(
                      child: Padding(
                        padding: activeMakeup?.insidePadding ?? EdgeInsets.zero,
                        child: Stack(
                          children: [
                            EditableText(
                              autofillHints: autoFillHints,
                              backgroundCursorColor: activeMakeup?.cursorColor ?? Colors.black,
                              controller: this.controller,
                              cursorColor: activeMakeup?.cursorColor ?? Colors.black,
                              cursorWidth: cursorWidth,
                              enableInteractiveSelection: true,
                              expands: activeMakeup?.expands ?? false,
                              focusNode: this.focusNode,
                              inputFormatters: activeMakeup?.inputFormatters,
                              keyboardType: activeMakeup?.keyboardType,
                              minLines: activeMakeup?.minLines,
                              maxLines: activeMakeup?.maxLines,
                              obscureText: obscured,
                              onChanged: this.onChanged,
                              onSelectionChanged: this.onSelectionChanged,
                              onSubmitted: this.onSubmitted,
                              onTapOutside: this.onTapOutside,
                              readOnly: readOnly,
                              scrollPadding: scrollPadding,
                              selectionColor: activeMakeup?.selectionColor,
                              selectionControls: this.selectionControls,
                              style: activeMakeup?.textStyle ?? TextStyle(),
                              textAlign: activeMakeup?.textAlign ?? TextAlign.start,
                            ),
                            if (hint != null && text.isEmpty)
                              SizedBox(child: hintBuilder?.call(this.event)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(child: rightWidgetBuilder?.call(this.event)),
                  ],
                ),
              ),
            ),
            if (error != null) SizedBox(child: errorBuilder?.call(this.event)),
          ],
        );
      },
    );
  }
}
