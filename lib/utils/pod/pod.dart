// //.title
// // ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
// //
// // XYZ Flutter Plus
// //
// // ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
// //.title~

// import '/all.dart';

// // ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// class Pod<T> extends ValueNotifier<T> {
//   //
//   //
//   //

//   bool isTemp;

//   //
//   //
//   //

//   Pod(super.value, {this.isTemp = false});

//   //
//   //
//   //

//   Pod.temp(T value) : this(value, isTemp: true);

//   //
//   //
//   //

//   Future<void> set(T value) async {
//     await Future.delayed(Duration.zero, () {
//       this.value = value;
//       this.notifyListeners();
//     });
//   }

//   //
//   //
//   //

//   Future<void> update(T Function(T) updater) async {
//     await Future.delayed(Duration.zero, () {
//       this.value = updater(value);
//       this.notifyListeners();
//     });
//   }

//   //
//   //
//   //

//   Future<void> refresh() async {
//     await Future.delayed(Duration.zero, () {
//       this.notifyListeners();
//     });
//   }

//   //
//   //
//   //

//   void disposeIfTemp() {
//     if (this.isTemp) {
//       this.dispose();
//     }
//   }
// }
