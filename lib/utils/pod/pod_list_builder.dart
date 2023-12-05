// //.title
// // ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
// //
// // XYZ Flutter Plus
// //
// // ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
// //.title~

// import '/all.dart';

// // ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// class PodListBuilder extends StatefulWidget {
//   //
//   //
//   //

//   final List<Pod?> pods;
//   final Widget Function(BuildContext, List) builder;

//   //
//   //
//   //

//   const PodListBuilder({
//     Key? key,
//     required this.pods,
//     required this.builder,
//   }) : super(key: key);

//   //
//   //
//   //

//   @override
//   _State createState() => _State();
// }

// // ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// class _State extends State<PodListBuilder> {
//   //
//   //
//   //

//   @override
//   void initState() {
//     super.initState();
//     for (final pod in this.widget.pods) {
//       pod?.addListener(_update);
//     }
//   }

//   //
//   //
//   //

//   @override
//   void didUpdateWidget(PodListBuilder oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     for (final oldPod in oldWidget.pods) {
//       oldPod?.removeListener(_update);
//     }
//     for (final newPod in this.widget.pods) {
//       newPod?.addListener(_update);
//     }
//   }

//   //
//   //
//   //

//   void _update() {
//     if (super.mounted) {
//       this.setState(() {});
//     }
//   }

//   //
//   //
//   //

//   @override
//   Widget build(final context) {
//     return this.widget.builder(context, this.widget.pods.map((e) => e?.value).toList());
//   }

//   //
//   //
//   //

//   @override
//   void dispose() {
//     for (final pod in this.widget.pods) {
//       pod?.removeListener(_update);
//     }
//     super.dispose();
//   }
// }
