// //.title
// // ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
// //
// // XYZ Flutter Plus
// //
// // ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
// //.title~

// import '/all.dart';

// // ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// class StreamPodBuilder<T> extends StatelessWidget {
//   //
//   //
//   //

//   final StreamPod<T> pod;

//   //
//   //
//   //

//   final Widget Function(BuildContext context, T value) builder;

//   //
//   //
//   //

//   const StreamPodBuilder({
//     super.key,
//     required this.pod,
//     required this.builder,
//   });

//   //
//   //
//   //

//   @override
//   Widget build(final context) {
//     return StreamBuilder<T>(
//       stream: pod.stream,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return builder(context, snapshot.data!);
//         } else {
//           return const SizedBox.shrink();
//         }
//       },
//     );
//   }
// }
