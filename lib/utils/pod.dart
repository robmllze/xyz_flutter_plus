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

class PodBuilder extends StatefulWidget {
  //
  //
  //

  final List<Pod?> pods;
  final Widget Function(BuildContext, List) builder;

  //
  //
  //

  const PodBuilder.multi({
    Key? key,
    required this.pods,
    required this.builder,
  }) : super(key: key);

  //
  //
  //

  PodBuilder({
    Key? key,
    required Pod? pod,
    required Widget Function(BuildContext, dynamic) builder,
  }) : this.multi(
          key: key,
          pods: [pod],
          builder: (context, values) => builder(context, values.firstOrNull),
        );

  //
  //
  //

  @override
  _PodBuilderState createState() => _PodBuilderState();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _PodBuilderState extends State<PodBuilder> {
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
  void didUpdateWidget(PodBuilder oldWidget) {
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
