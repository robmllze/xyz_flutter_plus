//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

part '_w_button_makeup.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const W_BUTTON_PARAMETERS = {
  "color": "Color?",
  "defaultHeight": "double?",
  "defaultWidth": "double?",
  "disabledMakeup": "WButtonMakeup?",
  "loaderMakeup": "WLoaderMakeup?",
  "padding": "EdgeInsets?",
  "shadow": "List<BoxShadow>?",
  "shape": "RoundedRectangleBorder?",
  "textStyle": "TextStyle?",
};

@GenerateMakeups(parameters: W_BUTTON_PARAMETERS)
class WButton extends StatefulWidget {
  //
  //
  //

  final WButtonMakeup? makeup;
  final String label;
  final bool expanded;
  final Widget? left, right;
  final FutureOr<void> Function()? onTap;
  final _FLoadingBuilder? loadingBuilder;
  final Pod<bool>? pEnabled;

  //
  //
  //

  factory WButton({
    Key? key,
    WButtonMakeup? makeup,
    String label = "WButton",
    bool expanded = false,
    Widget? left,
    Widget? right,
    FutureOr<void> Function()? onTap,
    Pod<bool>? pEnabled,
  }) {
    return WButton.loading(
      key: key,
      makeup: makeup,
      label: label,
      expanded: expanded,
      left: left,
      right: right,
      onTap: onTap,
      loadingBuilder: (Widget child, _) => child,
      pEnabled: pEnabled,
    );
  }

  //
  //
  //

  const WButton.loading({
    Key? key,
    this.makeup,
    required this.label,
    this.expanded = false,
    this.left,
    this.right,
    this.onTap,
    this.loadingBuilder,
    this.pEnabled,
  }) : super(key: key);

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WButton> {
  //
  //
  //

  final _pLoadingBuilder = Pod<_FLoadingBuilder?>(null);
  Completer<void>? _loadingCompleter;
  late final _pEnabled = this.widget.pEnabled;
  late final _loadingBuilder = this.widget.loadingBuilder
      // Default.
      ??
      (final child, final m) {
        final fontSize = m?.textStyle?.fontSize ?? $12;
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (this.widget.expanded) SizedBox(width: 1.5 * fontSize),
            child,
            SizedBox(width: 0.5 * fontSize),
            WLoader(
              makeup: m?.loaderMakeup?.copyWith(
                size: fontSize,
                strokeWidth: 0.16 * fontSize,
              ),
            ),
          ],
        );
      };

  //
  //
  //

  @override
  Widget build(_) {
    return PodBuilder(
      pod: this._pEnabled,
      builder: (final enabled0) {
        final enabled = enabled0 ?? true;
        final m =
            enabled ? this.widget.makeup : this.widget.makeup?.disabledMakeup ?? this.widget.makeup;
        final borderSide = m?.shape?.side;
        return GestureDetector(
          onTap: enabled ? this._load : null,
          child: Container(
            decoration: BoxDecoration(
              color: m?.color,
              boxShadow: m?.shadow,
              border: borderSide != null ? Border.fromBorderSide(borderSide) : null,
              borderRadius: m?.shape?.borderRadius,
            ),
            child: Padding(
              padding: m?.padding ?? EdgeInsets.all($4),
              child: SizedBox(
                width: widget.expanded ? double.infinity : m?.defaultWidth,
                height: m?.defaultHeight,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Center(
                    child: PodBuilder(
                      pod: this._pLoadingBuilder,
                      builder: (final loadingBuilder) {
                        final child = Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (this.widget.left != null) this.widget.left!,
                            Text(
                              this.widget.label,
                              style: m?.textStyle,
                            ),
                            if (this.widget.right != null) this.widget.right!,
                          ],
                        );
                        return loadingBuilder?.call(child, m) ?? child;
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  //
  //
  //

  Future<void> _load() async {
    this._loadingCompleter = Completer();
    final onTap = this.widget.onTap;
    if (onTap != null) {
      await this._pLoadingBuilder.set(this._loadingBuilder);
      await onTap();
      await this._pLoadingBuilder.set(null);
    }
    this._loadingCompleter!.complete();
  }

  //
  //
  //

  @override
  void dispose() {
    this._pEnabled?.disposeIfMarkedAsTemp();
    () async {
      await this._loadingCompleter?.future;
      this._pLoadingBuilder.dispose();
    };
    super.dispose();
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef _FLoadingBuilder = Widget Function(Widget child, WButtonMakeup? m)?;
