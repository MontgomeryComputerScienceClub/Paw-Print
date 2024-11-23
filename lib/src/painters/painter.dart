import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';

class EntireArticleBanner extends CustomPainter {
  final double w;
  final double h;
  EntireArticleBanner({required this.w, required this.h});

  @override
  void paint(Canvas canvas, Size size) {
    //canvas.drawRect(const Rect.fromLTRB(0, 0, 100, 100), Paint()..color = Constants.black);
    Paint paint = Paint()..color = Constants.green;
    var path = Path();

    path.moveTo(w - 25, 0);
    path.lineTo(w - 35, 0);
    path.lineTo(w, 35);
    path.lineTo(w, 25);
    path.lineTo(w - 25, 0);

    path.moveTo(w - 65, 0);
    path.lineTo(w - 75, 0);
    path.lineTo(w, 75);
    path.lineTo(w, 65);
    path.lineTo(w - 65, 0);

    canvas.drawPath(path, paint);

    paint = Paint()..color = Constants.gold;
    path = Path();

    path.moveTo(w - 5, 0);
    path.lineTo(w - 15, 0);
    path.lineTo(w, 15);
    path.lineTo(w, 5);
    path.lineTo(w - 5, 0);

    path.moveTo(w - 45, 0);
    path.lineTo(w - 55, 0);
    path.lineTo(w, 55);
    path.lineTo(w, 45);
    path.lineTo(w - 45, 0);

    path.moveTo(w - 85, 0);
    path.lineTo(w - 95, 0);
    path.lineTo(w, 95);
    path.lineTo(w, 85);
    path.lineTo(w - 85, 0);
    canvas.drawPath(path, paint);
    path.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ArticleFirstPreviewCellBanner extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Constants.gold;
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
    canvas.drawPath(path, paint);

    paint = Paint()..color = Constants.green;
    path = Path();
    path.moveTo(30, -21);
    path.lineTo(40, -21);
    path.lineTo(-10, 40);
    path.lineTo(-10, 29);
    path.lineTo(30, -21);
    canvas.drawPath(path, paint);
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
    Paint paint = Paint()..color = Constants.gold;
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
    canvas.drawPath(path, paint);

    paint = Paint()..color = Constants.green;
    path = Path();
    path.moveTo(30, -10);
    path.lineTo(40, -10);
    path.lineTo(-10, 40);
    path.lineTo(-10, 29);
    path.lineTo(30, -10);
    canvas.drawPath(path, paint);
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
    Paint paint = Paint()..color = Constants.gold;
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
    canvas.drawPath(path, paint);

    paint = Paint()..color = Constants.green;
    path = Path();
    path.moveTo(30, -10);
    path.lineTo(40, -10);
    path.lineTo(-10, 40);
    path.lineTo(-10, 29);
    path.lineTo(30, -10);
    canvas.drawPath(path, paint);
    path.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
