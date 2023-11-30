//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class Pod<T> extends ValueNotifier<T> {
  //
  //
  //

  bool isTemp;

  //
  //
  //

  Pod(super.value, {this.isTemp = false});

  //
  //
  //

  Pod.temp(T value) : this(value, isTemp: true);

  //
  //
  //

  Future<void> set(T value) async {
    await Future.delayed(Duration.zero, () {
      this.value = value;
      this.refresh();
    });
  }

  //
  //
  //

  Future<void> update(T Function(T) updater) async {
    await Future.delayed(Duration.zero, () {
      this.value = updater(value);
      this.refresh();
    });
  }

  //
  //
  //

  Future<void> refresh() async {
    await Future.delayed(Duration.zero, () {
      this.notifyListeners();
    });
  }

  //
  //
  //

  void disposeIfTemp() {
    if (this.isTemp) {
      this.dispose();
    }
  }
}

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
  _PodBuilderState<T> createState() => _PodBuilderState<T>();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _PodBuilderState<T> extends State<PodBuilder<T>> {
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
  Widget build(BuildContext context) {
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

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class PodListBuilder extends StatefulWidget {
  //
  //
  //

  final List<Pod?> pods;
  final Widget Function(BuildContext, List) builder;

  //
  //
  //

  const PodListBuilder({
    Key? key,
    required this.pods,
    required this.builder,
  }) : super(key: key);

  //
  //
  //

  @override
  _PodListBuilderState createState() => _PodListBuilderState();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _PodListBuilderState extends State<PodListBuilder> {
  //
  //
  //

  @override
  void initState() {
    super.initState();
    for (final pod in this.widget.pods) {
      pod?.addListener(_update);
    }
  }

  //
  //
  //

  @override
  void didUpdateWidget(PodListBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    for (final oldPod in oldWidget.pods) {
      oldPod?.removeListener(_update);
    }
    for (final newPod in this.widget.pods) {
      newPod?.addListener(_update);
    }
  }

  //
  //
  //

  void _update() {
    if (super.mounted) {
      this.setState(() {});
    }
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return this.widget.builder(context, this.widget.pods.map((e) => e?.value).toList());
  }

  //
  //
  //

  @override
  void dispose() {
    for (final pod in this.widget.pods) {
      pod?.removeListener(_update);
    }
    super.dispose();
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MultiPodBuilder<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z>
    extends PodListBuilder {
  //
  //
  //

  MultiPodBuilder({
    Key? key,
    required Pods<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z>
        pods,
    required Widget Function(
      BuildContext,
      Pods<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z>,
    ) builder,
  }) : super(
          key: key,
          pods: pods.toList(),
          builder: (final context, final values) {
            return builder(
              context,
              Pods<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z>(
                podA: values.elementAtOrNull(0),
                podB: values.elementAtOrNull(1),
                podC: values.elementAtOrNull(2),
                podD: values.elementAtOrNull(3),
                podE: values.elementAtOrNull(4),
                podF: values.elementAtOrNull(5),
                podG: values.elementAtOrNull(6),
                podH: values.elementAtOrNull(7),
                podI: values.elementAtOrNull(8),
                podJ: values.elementAtOrNull(9),
                podK: values.elementAtOrNull(10),
                podL: values.elementAtOrNull(11),
                podM: values.elementAtOrNull(12),
                podN: values.elementAtOrNull(13),
                podO: values.elementAtOrNull(14),
                podP: values.elementAtOrNull(15),
                podQ: values.elementAtOrNull(16),
                podR: values.elementAtOrNull(17),
                podS: values.elementAtOrNull(18),
                podT: values.elementAtOrNull(19),
                podU: values.elementAtOrNull(20),
                podV: values.elementAtOrNull(21),
                podW: values.elementAtOrNull(22),
                podX: values.elementAtOrNull(23),
                podY: values.elementAtOrNull(24),
                podZ: values.elementAtOrNull(25),
              ),
            );
          },
        );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class Pods<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z> {
  //
  //
  //

  final Pod<A>? podA;
  final Pod<B>? podB;
  final Pod<C>? podC;
  final Pod<D>? podD;
  final Pod<E>? podE;
  final Pod<F>? podF;
  final Pod<G>? podG;
  final Pod<H>? podH;
  final Pod<I>? podI;
  final Pod<J>? podJ;
  final Pod<K>? podK;
  final Pod<L>? podL;
  final Pod<M>? podM;
  final Pod<N>? podN;
  final Pod<O>? podO;
  final Pod<P>? podP;
  final Pod<Q>? podQ;
  final Pod<R>? podR;
  final Pod<S>? podS;
  final Pod<T>? podT;
  final Pod<U>? podU;
  final Pod<V>? podV;
  final Pod<W>? podW;
  final Pod<X>? podX;
  final Pod<Y>? podY;
  final Pod<Z>? podZ;

  //
  //
  //

  Pods({
    this.podA,
    this.podB,
    this.podC,
    this.podD,
    this.podE,
    this.podF,
    this.podG,
    this.podH,
    this.podI,
    this.podJ,
    this.podK,
    this.podL,
    this.podM,
    this.podN,
    this.podO,
    this.podP,
    this.podQ,
    this.podR,
    this.podS,
    this.podT,
    this.podU,
    this.podV,
    this.podW,
    this.podX,
    this.podY,
    this.podZ,
  });

  //
  //
  //

  A? get a => this.podA?.value;
  B? get b => this.podB?.value;
  C? get c => this.podC?.value;
  D? get d => this.podD?.value;
  E? get e => this.podE?.value;
  F? get f => this.podF?.value;
  G? get g => this.podG?.value;
  H? get h => this.podH?.value;
  I? get i => this.podI?.value;
  J? get j => this.podJ?.value;
  K? get k => this.podK?.value;
  L? get l => this.podL?.value;
  M? get m => this.podM?.value;
  N? get n => this.podN?.value;
  O? get o => this.podO?.value;
  P? get p => this.podP?.value;
  Q? get q => this.podQ?.value;
  R? get r => this.podR?.value;
  S? get s => this.podS?.value;
  T? get t => this.podT?.value;
  U? get u => this.podU?.value;
  V? get v => this.podV?.value;
  W? get w => this.podW?.value;
  X? get x => this.podX?.value;
  Y? get y => this.podY?.value;
  Z? get z => this.podZ?.value;

  //
  //
  //

  List<Pod?> toList() {
    return [
      this.podA,
      this.podB,
      this.podC,
      this.podD,
      this.podE,
      this.podF,
      this.podG,
      this.podH,
      this.podI,
      this.podJ,
      this.podK,
      this.podL,
      this.podM,
      this.podN,
      this.podO,
      this.podP,
      this.podQ,
      this.podR,
      this.podS,
      this.podT,
      this.podU,
      this.podV,
      this.podW,
      this.podX,
      this.podY,
      this.podZ,
    ];
  }
}
