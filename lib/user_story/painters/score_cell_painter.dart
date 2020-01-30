import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snake_game/common/constants.dart';
import 'package:snake_game/models/cells/score_cell.dart';
import 'package:snake_game/user_story/common/app_theme.dart';

class ScoreCellPainter extends CustomPainter {
  final ScoreCell scoreCell;

  ScoreCellPainter(this.scoreCell);

  @override
  void paint(Canvas canvas, Size size) {
    final offset = Offset(cellSize.width * scoreCell.position.x, cellSize.height * scoreCell.position.y);
    Rect rect = offset & cellSize;
    canvas.drawRect(rect, Paint()..color = AppTheme.current.accentColor);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}