import 'package:flutter/material.dart';

class drawer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint();

    Rect rect = new Rect.fromPoints(
        Offset(0, size.height), Offset(size.width, size.height));

    paint.strokeWidth = 10;
    // paint.color = Colors.red;
    paint.shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.indigo, Colors.red]).createShader(rect);
    paint.style = PaintingStyle.fill;
    // canvas.drawLine(Offset(size.width / 4, size.height / 2),
    //     Offset(size.width * 0.75, size.height * 0.75), paint);
    // canvas.drawLine(Offset(size.width / 4, size.height / 2),
    //     Offset(size.width * 0.75, size.height / 2), paint);
    // canvas.drawRect(rect, paint);
    // canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(80)), paint);
    var path = new Path();
    path.lineTo(0, 0);
    path.quadraticBezierTo(size.width, size.height * 4, size.width * 2, 0);
    // path.lineTo(size.width, size.height * 2);
    // path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
