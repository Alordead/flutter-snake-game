import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:snake_game/common/constants.dart';
import 'package:snake_game/user_story/common/app_theme.dart';

class GlowLinePainter extends CustomPainter {
  final double offset;

  GlowLinePainter(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    final topOffset = Offset(0, offset);
    final rect = topOffset & Size(size.width, glowHeight);

    final Gradient gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: _defaultColors,
        stops: _defaultStops
    );

    final paint = Paint()..shader = gradient.createShader(rect);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  final List<Color> _defaultColors = [
    AppTheme.current.accentColor.withOpacity(0),
    AppTheme.current.accentColor.withOpacity(0.1),
  ];

  final List<double> _defaultStops = [0.0, 1.0];

}