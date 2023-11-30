//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// XYZ Flutter Plus
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:async' show StreamController;
import 'dart:collection' show Queue;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class StreamPod<T> {
  //
  //
  //

  final StreamController<T> _controller = StreamController<T>.broadcast(sync: true);

  //
  //
  //

  Stream<T> get stream => this._controller.stream;
  bool isTemp = false;
  int bufferLength = 0;
  final _buffer = Queue<T>();

  //
  //
  //

  StreamPod(T value, {this.isTemp = false}) {
    this.set(value);
  }

  factory StreamPod.temp(T value) {
    return StreamPod<T>(value, isTemp: true);
  }

  //
  //
  //

  T valueAt([int index = 0]) => this._buffer.elementAt(index);

  T get value => this._buffer.first;

  //
  //
  //

  void set(T value) {
    Future.delayed(Duration.zero, () {
      while (this._buffer.length > this.bufferLength) {
        this._buffer.removeFirst();
      }
      this._buffer.addFirst(value);
      this._controller.add(value);
    });
  }

  //
  //
  //

  void update(T Function(T value) updater) {
    final value = updater(this.value);
    this.set(value);
  }

  //
  //
  //

  T call() => this.value;

  //
  //
  //

  T operator [](int index) => this._buffer.elementAt(index);

  //
  //
  //

  T operator >>(int value) {
    for (var i = 0; i < value; i++) {
      if (this._buffer.isNotEmpty) {
        final item = this._buffer.removeLast();
        this._buffer.addFirst(item);
      }
    }
    this._controller.add(this.value);
    return this.value;
  }

  //
  //
  //

  T operator <<(int value) {
    for (var i = 0; i < value; i++) {
      if (this._buffer.isNotEmpty) {
        final item = this._buffer.removeFirst();
        this._buffer.addLast(item);
      }
    }
    this._controller.add(this.value);
    return this.value;
  }

  //
  //
  //

  void dispose() {
    this._controller.close();
  }

  //
  //
  //

  void disposeIfTemp() {
    if (this.isTemp) {
      this.dispose();
    }
  }

  //
  //
  //

  void clearHistory() {
    this._buffer.clear();
  }
}
