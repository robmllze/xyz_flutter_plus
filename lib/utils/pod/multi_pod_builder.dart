//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

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