import 'package:flutter/material.dart';

class BackgroundCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color =
      Color(0xff5cb0cc).withOpacity(0.5) // secondaryColor with opacity
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height * 0.28);
    path.cubicTo(size.width / 4, size.height * 0.31, 3 * size.width / 4,
        size.height * 0.4, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}