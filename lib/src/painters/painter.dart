import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';

class ArticleFirstPreviewCellBanner extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()..color = Constants.gold;
    var path = Path();
    path.moveTo(10, -21);
    path.lineTo(20, -21);
    path.lineTo(-10, 21);
    path.lineTo(-10, 7);
    path.lineTo(10, -21);

    path.moveTo(50, -21);
    path.lineTo(60, -21);
    path.lineTo(-10, 60);
    path.lineTo(-10, 49);
    path.lineTo(50, -21);
    canvas.drawPath(path, _paint);

    _paint = Paint()..color = Constants.green;
    path = Path();
    path.moveTo(30, -21);
    path.lineTo(40, -21);
    path.lineTo(-10, 40);
    path.lineTo(-10, 29);
    path.lineTo(30, -21);
    canvas.drawPath(path, _paint);
    path.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ArticlePreviewCellBanner extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()..color = Constants.gold;
    var path = Path();
    path.moveTo(10, -10);
    path.lineTo(20, -10);
    path.lineTo(-10, 20);
    path.lineTo(-10, 7);
    path.lineTo(10, -10);

    path.moveTo(50, -10);
    path.lineTo(60, -10);
    path.lineTo(-10, 60);
    path.lineTo(-10, 49);
    path.lineTo(50, -10);
    canvas.drawPath(path, _paint);

    _paint = Paint()..color = Constants.green;
    path = Path();
    path.moveTo(30, -10);
    path.lineTo(40, -10);
    path.lineTo(-10, 40);
    path.lineTo(-10, 29);
    path.lineTo(30, -10);
    canvas.drawPath(path, _paint);
    path.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ArticlePreviewRowBanner extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()..color = Constants.gold;
    var path = Path();
    path.moveTo(10, -10);
    path.lineTo(20, -10);
    path.lineTo(-10, 20);
    path.lineTo(-10, 7);
    path.lineTo(10, -10);

    path.moveTo(50, -10);
    path.lineTo(60, -10);
    path.lineTo(-10, 60);
    path.lineTo(-10, 49);
    path.lineTo(50, -10);
    canvas.drawPath(path, _paint);

    _paint = Paint()..color = Constants.green;
    path = Path();
    path.moveTo(30, -10);
    path.lineTo(40, -10);
    path.lineTo(-10, 40);
    path.lineTo(-10, 29);
    path.lineTo(30, -10);
    canvas.drawPath(path, _paint);
    path.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
