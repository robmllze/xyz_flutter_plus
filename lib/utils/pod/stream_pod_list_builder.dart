// //.title
// // ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
// //
// // XYZ Flutter Plus
// //
// // ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
// //.title~

// import 'package:flutter/material.dart';
// import 'dart:async';

// import 'stream_pod.dart';

// // ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// class StreamPodListBuilder extends StatefulWidget {
//   //
//   //
//   //

//   final List<StreamPod<dynamic>> pods;
//   final Widget Function(BuildContext, List<dynamic>) builder;

//   //
//   //
//   //

//   const StreamPodListBuilder({
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

// class _State extends State<StreamPodListBuilder> {
//   //
//   //
//   //

//   final _controller = StreamController<List<dynamic>>();
//   final _subscriptions = <StreamSubscription<dynamic>>[];
//   late final _combinedStream = _combineStreams(this.widget.pods);

//   //
//   //
//   //

//   Stream<List<dynamic>> _combineStreams(List<StreamPod<dynamic>> pods) {
//     void emitLatestValues() {
//       this._controller.add(pods.map((pod) => pod.value).toList());
//     }

//     for (final pod in pods) {
//       final subscription = pod.stream.listen((_) => emitLatestValues());
//       this._subscriptions.add(subscription);
//     }

//     this._controller.onCancel = () {
//       for (final subscription in _subscriptions) {
//         subscription.cancel();
//       }
//     };

//     emitLatestValues();

//     return _controller.stream;
//   }

//   //
//   //
//   //

//   @override
//   Widget build(final context) {
//     return StreamBuilder<List<dynamic>>(
//       stream: this._combinedStream,
//       builder: (final context, final snapshot) {
//         if (snapshot.hasData) {
//           return widget.builder(context, snapshot.data!);
//         } else {
//           return const SizedBox();
//         }
//       },
//     );
//   }

//   //
//   //
//   //

//   @override
//   void dispose() {
//     Future.wait(this._subscriptions.map((e) => e.cancel()));
//     super.dispose();
//   }
// }
