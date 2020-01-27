import 'package:flutter/cupertino.dart';
import 'package:snake_game/user_story/painters/score_cell_painter.dart';
import 'package:snake_game/user_story/painters/snake_painter.dart';

class GamePainter extends CustomPainter {
  final SnakePainter snakePainter;
  final ScoreCellPainter scoreCellPainter;

  GamePainter(this.snakePainter, this.scoreCellPainter);

  @override
  void paint(Canvas canvas, Size size) {
    snakePainter.paint(canvas, size);
    scoreCellPainter.paint(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}