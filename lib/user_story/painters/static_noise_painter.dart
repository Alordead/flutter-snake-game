import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:snake_game/user_story/common/app_theme.dart';

const _step = 30;

class StaticNoisePainter extends CustomPainter {
  final Color color;

  StaticNoisePainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final random = Random();
    final paint = Paint();
    List<Offset> points = [];

    for (int i = 0; i < size.width; i += _step) {
      for (int j = 0; j < size.height; j += _step) {
        final point = Offset(
          random.nextDouble() * size.width,
          random.nextDouble() * size.height,
        );
        points.add(point);
      }
    }

    paint.color = (color ?? AppTheme.current.accentColor).withOpacity(0.2);
    paint.strokeWidth = 1.5;

    canvas.drawPoints(PointMode.points, points, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}