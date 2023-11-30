//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/all.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class SimplePod<T> extends ValueNotifier<T> {
  //
  //
  //

  bool isTemp;

  //
  //
  //

  SimplePod(super.value, {this.isTemp = false});

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
