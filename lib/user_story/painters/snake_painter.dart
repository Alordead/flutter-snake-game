import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snake_game/common/constants.dart';
import 'package:snake_game/models/snake.dart';
import 'package:snake_game/user_story/common/app_theme.dart';

class SnakePainter extends CustomPainter {
  final Snake snake;

  SnakePainter(this.snake);

  @override
  void paint(Canvas canvas, Size size) {
    snake.body.forEach((cell) {
      final offset = Offset(cellSize.width * cell.position.x, cellSize.height * cell.position.y);
      Rect rect = offset & cellSize;
      canvas.drawRect(rect, Paint()..color = AppTheme.accentColor);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}