import 'package:flutter/material.dart';

class ForegroundCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..shader = LinearGradient(
        colors: [Color(0xff0d4c8e), Color(0xff5cb0cc)],
        // الألوان التي تريد استخدامها في التدرج
        begin: Alignment.topLeft,
        // نقطة البداية للتدرج
        end: Alignment.bottomRight, // نقطة النهاية للتدرج
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height * 0.3);
    path.cubicTo(size.width * 0.3, size.height * 0.18, size.width * 0.7,
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
