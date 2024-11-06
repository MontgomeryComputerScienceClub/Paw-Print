import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()..color = const Color.fromARGB(255, 255, 215, 0);
    var path = Path();
    path.moveTo(0, -20);
    path.lineTo(10, -20);
    path.lineTo(-10, 10);
    path.lineTo(-10, -5);
    path.lineTo(0, -20);

    // path.lineTo(0, 10);
    // path.lineTo(0, 10);
    // path.lineTo(0, -20);

    // path.lineTo(0, -20);

    path.close();

    canvas.drawPath(path, _paint);

    // final rect = Rect.fromPoints(Offset(0, 0), Offset(100, 100));
    // canvas.drawRect(rect, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
