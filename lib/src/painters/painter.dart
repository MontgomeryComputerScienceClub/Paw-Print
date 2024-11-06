import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()..color = const Color.fromARGB(255, 255, 215, 0);
    var path = Path();
    path.moveTo(10, -20);
    path.lineTo(20, -20);
    path.lineTo(-10, 20);
    path.lineTo(-10, 7);
    path.lineTo(10, -20);

    path.moveTo(50, -20);
    path.lineTo(60, -20);
    path.lineTo(-10, 60);
    path.lineTo(-10, 49);
    path.lineTo(50, -20);
    canvas.drawPath(path, _paint);

    _paint = Paint()..color = Colors.green;
    path = Path();
    path.moveTo(30, -20);
    path.lineTo(40, -20);
    path.lineTo(-10, 40);
    path.lineTo(-10, 29);
    path.lineTo(30, -20);
    canvas.drawPath(path, _paint);

    // path.lineTo(0, 10);
    // path.lineTo(0, 10);
    // path.lineTo(0, -20);

    // path.lineTo(0, -20);

    path.close();

    // final rect = Rect.fromPoints(Offset(0, 0), Offset(100, 100));
    // canvas.drawRect(rect, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
