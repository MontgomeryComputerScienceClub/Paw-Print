import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';

class EntireArticleBanner extends CustomPainter {
  EntireArticleBanner();

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Constants.green;
    var path = Path();

    path.moveTo(size.width - 25, 0);
    path.lineTo(size.width - 35, 0);
    path.lineTo(size.width, 35);
    path.lineTo(size.width, 25);
    path.lineTo(size.width - 25, 0);

    path.moveTo(size.width - 65, 0);
    path.lineTo(size.width - 75, 0);
    path.lineTo(size.width, 75);
    path.lineTo(size.width, 65);
    path.lineTo(size.width - 65, 0);

    canvas.drawPath(path, paint);

    paint = Paint()..color = Constants.gold;
    path = Path();

    path.moveTo(size.width - 5, 0);
    path.lineTo(size.width - 15, 0);
    path.lineTo(size.width, 15);
    path.lineTo(size.width, 5);
    path.lineTo(size.width - 5, 0);

    path.moveTo(size.width - 45, 0);
    path.lineTo(size.width - 55, 0);
    path.lineTo(size.width, 55);
    path.lineTo(size.width, 45);
    path.lineTo(size.width - 45, 0);

    path.moveTo(size.width - 85, 0);
    path.lineTo(size.width - 95, 0);
    path.lineTo(size.width, 95);
    path.lineTo(size.width, 85);
    path.lineTo(size.width - 85, 0);
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
