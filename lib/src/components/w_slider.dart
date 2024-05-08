//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WSlider extends StatefulWidget {
  //
  //
  //

  final double min;
  final double max;
  final Pod<double> pValue;
  final ValueChanged<double>? onChanged;
  final Color trackColor;
  final Color thumbColor;
  final double thumbRadius;
  final double trackStrokeWidth;
  final double thumbStrokeWidth;
  final double trackCornerRadius;

  //
  //
  //

  const WSlider({
    super.key,
    required this.min,
    required this.max,
    required this.pValue,
    this.trackColor = Colors.grey,
    this.thumbColor = Colors.blue,
    this.thumbRadius = 4.0,
    this.trackStrokeWidth = 4.0,
    this.thumbStrokeWidth = 2.0,
    this.trackCornerRadius = 0.0,
    this.onChanged,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WSlider> {
  //
  //
  //

  late final pValue = this.widget.pValue;

  //
  //
  //

  @override
  void initState() {
    assert(this.pValue.value <= this.widget.max);
    assert(this.pValue.value >= this.widget.min);
    super.initState();
  }

  //
  //
  //

  void _updateValue(Offset localPosition, BoxConstraints constraints) {
    final dx = localPosition.dx.clamp(0, constraints.maxWidth);
    final newValue = this.widget.min +
        (this.widget.max - this.widget.min) * (dx / constraints.maxWidth);
    if (this.pValue.value != newValue && this.widget.onChanged != null) {
      this.widget.onChanged!(newValue);
    }
    this.pValue.set(newValue);
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: this.pValue,
      builder: (_, final value, __) {
        return LayoutBuilder(
          builder: (_, final constraints) {
            final thumbX = ((value - this.widget.min) /
                    (this.widget.max - this.widget.min)) *
                constraints.maxWidth;
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onPanStart: (final details) {
                this._updateValue(details.localPosition, constraints);
              },
              onPanUpdate: (final details) {
                this._updateValue(details.localPosition, constraints);
              },
              child: CustomPaint(
                size: Size(constraints.maxWidth, constraints.maxHeight),
                painter: _Painter(
                  thumbX: thumbX,
                  thumbRadius: widget.thumbRadius,
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  trackColor: widget.trackColor,
                  thumbColor: widget.thumbColor,
                  trackStrokeWidth: widget.trackStrokeWidth,
                  thumbStrokeWidth: widget.thumbStrokeWidth,
                  trackCornerRadius: widget.trackCornerRadius,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _Painter extends CustomPainter {
  //
  //
  //

  final double thumbX;
  final double thumbRadius;
  final Size size;
  final Color trackColor;
  final Color thumbColor;
  final double trackStrokeWidth;
  final double thumbStrokeWidth;
  final double trackCornerRadius;

  //
  //
  //

  _Painter({
    required this.thumbX,
    required this.thumbRadius,
    required this.size,
    required this.trackColor,
    required this.thumbColor,
    required this.trackStrokeWidth,
    required this.thumbStrokeWidth,
    required this.trackCornerRadius,
  });

  //
  //
  //

  @override
  void paint(Canvas canvas, Size size) {
    final trackPaint = Paint()
      ..color = trackColor
      ..strokeWidth = trackStrokeWidth;
    final thumbPaint = Paint()
      ..color = thumbColor
      ..strokeWidth = thumbStrokeWidth;

    final trackRRect = RRect.fromLTRBR(
      0,
      size.height / 2 - trackStrokeWidth / 2,
      size.width,
      size.height / 2 + trackStrokeWidth / 2,
      Radius.circular(trackCornerRadius),
    );

    final thumbCenter = Offset(thumbX, size.height / 2);
    canvas.drawRRect(trackRRect, trackPaint);
    canvas.drawCircle(thumbCenter, thumbRadius, thumbPaint);
  }

  //
  //
  //

  @override
  bool shouldRepaint(_Painter oldDelegate) {
    return oldDelegate.thumbX != thumbX ||
        oldDelegate.trackCornerRadius != trackCornerRadius;
  }
}
