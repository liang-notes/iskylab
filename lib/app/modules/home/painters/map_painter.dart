import 'package:flutter/material.dart';
import '../course_gps_vector_details_model.dart';

class MapPainter extends CustomPainter {
  final VectorGPS? vectors;
  late Paint _paint;
  MapPainter({required this.vectors}) {
    _paint = Paint()
      ..strokeWidth = 0.1
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (vectors == null) return;
    if (vectors!.shapes == null) return;
    canvas.clipRect(Rect.fromPoints(Offset.zero, Offset(size.width, size.height)));
    canvas.translate(size.width / 2, size.height / 2);
    if (vectors!.shapes?.shape == null) return;
    if (vectors!.shapes?.shape?.isEmpty == true) return;
    final points = vectors!.shapes?.shape?.first.points;
    if (points == null) return;
    if (!points.contains(',')) return;
    final offsets = toOffsets(points);
    double dx = offsets.first.dx;
    double dy = offsets.first.dy;
    canvas.translate(dx, -dy);
    double rate = 0.2;
    canvas.translate(700 * rate, 350 * rate);
    canvas.scale(8 * rate, -10.5 * rate);
    _drawMap(canvas, size);
    // Paint paint = Paint()
    //   ..color = Colors.orange
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 1;
    // Offset p1 = const Offset(100, 100);
    // Offset p2 = const Offset(120, -60);
    // Path path = Path();
    // path.lineTo(dx, dy);
    // path.lineTo(p1.dx, p1.dy);
    // canvas.drawPath(path, paint);
  }

  List<Offset> toOffsets(String? points) {
    if (points == null) return [Offset.zero];

    List<Offset> offsets = [];
    if (points.contains(',')) {
      final ps = points.split(',');
      for (var element in ps) {
        final offset = Offset(double.parse(element.split(' ').first), double.parse(element.split(' ').last));
        offsets.add(offset);
      }
    } else {
      final offset = Offset(double.parse(points.split(' ').first), double.parse(points.split(' ').last));
      offsets.add(offset);
    }
    return offsets;
  }

  void _drawMap(Canvas canvas, Size size) {
    final shapes = vectors!.shapes!.shape;
    for (int i = 0; i < (shapes?.length ?? 0); i++) {
      var shape = shapes?[i];
      if (shape == null) return;
      PaintingStyle style;
      Color color;
      Path path = Path();
      final coordinates = toOffsets(shape.points);
      final Offset first = coordinates.first;
      path.moveTo(first.dx, first.dy);
      for (Offset d in coordinates) {
        path.lineTo(d.dx, d.dy);
      }
      // style = PaintingStyle.fill;
      color = Colors.black;

      canvas.drawPath(
        path,
        _paint
          ..color = color
          // ..style = style,
      );
    }
  }

  @override
  bool shouldRepaint(covariant MapPainter oldDelegate) {
    // return oldDelegate.vectors != vectors;
    return true;
  }
}
