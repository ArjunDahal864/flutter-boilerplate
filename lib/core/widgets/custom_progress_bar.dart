import 'dart:math';

import 'package:flutter/material.dart';

class CustomCircularProgressBar{
  // change color in each rotation
  static const List<Color> colors = [
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.yellow,
    Colors.cyan,
    Colors.teal,
    Colors.lime,
    Colors.indigo,
    Colors.lightBlue,
    Colors.amber,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.black,
  ];

  static Widget circularProgressBar(BuildContext context, double value,
      {double size = 50.0, Color color = Colors.blue}) {
    return SizedBox(
      height: size,
      width: size,
      child: CustomPaint(
        painter: CircularProgressBarPainter(
          value: value,
          color: color,
          colors: colors,
        ),
      ),
    );
  }
}

class CircularProgressBarPainter extends CustomPainter{
  final double value;
  final Color color;
  final List<Color> colors;

  CircularProgressBarPainter({required this.value, required this.color, required this.colors});
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.width / 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);

    final angle = 2 * pi * (value / 100);

    final arcPaint = Paint()
      ..color = colors[(value / 10).floor()]
      ..strokeWidth = size.width / 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}