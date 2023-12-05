//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WTextFieldSearch<T> extends StatefulWidget {
  //
  //
  //

  final String pHint;
  final Pod<String> pValue;
  final Future<Set<T>> Function(String) resultBuilder;
  final Widget Function(T) itemBuilder;
  final void Function(T)? onTapItem;

  //
  //
  //

  const WTextFieldSearch({
    super.key,
    required this.pHint,
    required this.pValue,
    required this.resultBuilder,
    required this.itemBuilder,
    this.onTapItem,
  });

  //
  //
  //

  @override
  _State<T> createState() => _State<T>();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State<T> extends State<WTextFieldSearch<T>> {
  //
  //
  //

  Set<T>? _results;

  //
  //
  //

  late final debouncer = Debouncer(
    delay: const Duration(milliseconds: 500),
    onWaited: () {
      this.widget.resultBuilder(this.widget.pValue.value).then((final results) {
        this.setState(() {
          this._results = results;
        });
      });
    },
  );

  //
  //
  //

  @override
  void dispose() {
    debouncer.cancel();
    super.dispose();
  }

  //
  //
  //
  @override
  Widget build(_) {
    return Column(
      children: [
        WTextField(
          pHint: Pod.temp(this.widget.pHint),
          pValue: this.widget.pValue,
          onChanged: (_) => this.debouncer(),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: $200),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: $12),
            child: WScrollable(
              child: Padding(
                padding: EdgeInsets.only(top: $44),
                child: Column(
                  children: this._results?.map(
                        (final l) {
                          return GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () => this.widget.onTapItem?.call(l),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: $12),
                              child: this.widget.itemBuilder(l),
                            ),
                          );
                        },
                      ).toList() ??
                      [],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
