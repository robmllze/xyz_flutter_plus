//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WRadioList<T> extends StatefulWidget {
  //
  //
  //

  final WRadioMakeup? makeup;
  final Pod<String>? pTitle;
  final Pod<bool>? pShowTitleDot;
  final Pod pValue;
  final Pod<bool>? pEnabled;
  final Pod<String?>? pErrorText;
  final List<T> options;
  final Widget Function(T)? optionBuilder;
  final WRadioList_SelectMode selectMode;
  final void Function(T option, bool value, List<T> all)? onTap;

  //
  //
  //

  const WRadioList({
    Key? key,
    this.makeup,
    this.pTitle,
    this.pShowTitleDot,
    required this.pValue,
    this.pEnabled,
    this.pErrorText,
    this.options = const [],
    this.optionBuilder,
    this.selectMode = WRadioList_SelectMode.MULTIPLE,
    this.onTap,
  }) : super(key: key);

  //
  //
  //

  @override
  _State<T> createState() => _State<T>();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State<T> extends State<WRadioList<T>> {
  //
  //
  //

  Future<void> Function(T)? _onTap;
  late final _pTitle = this.widget.pTitle;
  late final _pShowTitleDot = this.widget.pShowTitleDot;
  late final _pValue = this.widget.pValue;
  late final _pEnabled = this.widget.pEnabled;
  late final _pErrorText = this.widget.pErrorText;

  //
  //
  //

  @override
  void dispose() {
    this._pTitle?.disposeIfTemp();
    this._pValue.disposeIfTemp();
    this._pEnabled?.disposeIfTemp();
    this._pErrorText?.disposeIfTemp();
    super.dispose();
  }

  //
  //
  //

  @override
  void initState() {
    super.initState();
    switch (this.widget.selectMode) {
      case WRadioList_SelectMode.MULTIPLE:
        this._onTap = this._onTapMultiple;
        break;
      case WRadioList_SelectMode.MULTIPLE_OR_NULL:
        this._onTap = this._onTapMultipleOrNull;
        break;
      case WRadioList_SelectMode.SINGLE:
        this._onTap = this._onTapSingle;
        break;
      case WRadioList_SelectMode.SINGLE_OR_NULL:
        this._onTap = this._onTapSingleOrNull;
        break;
    }
  }

  //
  //
  //

  @override
  Widget build(_) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PodBuilder.multi(
          pods: [this._pTitle, this._pShowTitleDot],
          builder: (_, final values) {
            final [title, showTitleDot] = values;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(child: this.widget.makeup?.titleBuilder?.call(title)),
                SizedBox(child: this.widget.makeup?.titleDotBuilder?.call(showTitleDot)),
              ],
            );
          },
        ),
        PodBuilder(
          pod: this._pValue,
          builder: (_, value) {
            return Wrap(
              direction: Axis.horizontal,
              runSpacing: 0.5 * (this.widget.makeup?.size ?? 0.0),
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ...this.widget.options.map((final option) {
                  final contains = letList(this._pValue.value)?.contains(option) == true;
                  return WRadioB(
                    pValue: Pod<bool>.temp(contains),
                    pEnabled: this._pEnabled,
                    pErrorText: this._pErrorText,
                    makeup: this.widget.makeup,
                    onTap: (_) async {
                      await this._onTap?.call(option);
                    },
                    children: [
                      Expanded(
                        child: this.widget.optionBuilder?.call(option) ??
                            Text(
                              option.toString(),
                              softWrap: true,
                              style: this.widget.makeup?.elementStyle,
                            ),
                      ),
                    ],
                  );
                }),
              ],
            );
          },
        ),
        PodBuilder(
          pod: this._pErrorText,
          builder: (_, final errorText) {
            if (errorText != null && errorText.isNotEmpty) {
              return Padding(
                padding: EdgeInsets.only(top: $8),
                child: Text(
                  errorText,
                  style: this.widget.makeup?.errorStyle,
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }

  //
  //
  //

  Future<void> _onTapMultiple(T option) async {
    final value0 = letList(this._pValue.value);
    final contains = value0?.contains(option) == true;
    if (contains) {
      if (value0!.length > 1) {
        await this._pValue.update((final a) => List<T>.of(a)..remove(option));
      }
    } else {
      await this._pValue.update((final a) => List<T>.of(a)..add(option));
    }
    final value1 = (this._pValue.value as List).cast<T>();
    this.widget.onTap?.call(option, !contains, value1);
  }

  //
  //
  //

  Future<void> _onTapMultipleOrNull(T option) async {
    final value0 = letList(this._pValue.value);
    final contains = value0?.contains(option) == true;
    if (contains) {
      await this._pValue.update((final a) => List<T>.of(a)..remove(option));
    } else {
      await this._pValue.update((final a) => List<T>.of(a)..add(option));
    }
    final value = (this._pValue.value as List).cast<T>();
    this.widget.onTap?.call(option, !contains, value);
  }

  //
  //
  //

  Future<void> _onTapSingle(T option) async {
    final value0 = letList(this._pValue.value);
    final contains = value0?.contains(option) == true;
    await this._pValue.set(<T>[option]);
    final value = (this._pValue.value as List).cast<T>();
    this.widget.onTap?.call(option, !contains, value);
  }

  //
  //
  //

  Future<void> _onTapSingleOrNull(T option) async {
    final value0 = letList(this._pValue.value);
    final contains = value0?.contains(option) == true;
    if (contains) {
      await this._pValue.set(<T>[]);
    } else {
      await this._pValue.set(<T>[option]);
    }
    final value = (this._pValue.value as List).cast<T>();
    this.widget.onTap?.call(option, !contains, value);
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum WRadioList_SelectMode {
  SINGLE,
  SINGLE_OR_NULL,
  MULTIPLE,
  MULTIPLE_OR_NULL,
}

WRadioList_SelectMode? labelToWFieldListRadioSelectMode(String? label) {
  if (label != null) {
    for (final a in WRadioList_SelectMode.values) {
      if (label.trim().toUpperCase() == a.name) {
        return a;
      }
    }
  }
  return null;
}
