import 'dart:math';

import 'package:snake_game/common/constants.dart';

class ScoreCell {
  Point position;

  ScoreCell() {
    randomizePosition();
  }

  randomizePosition() {
    int x = Random().nextInt(boardSize.width.toInt() - 1);
    int y = Random().nextInt(boardSize.height.toInt() - 1);
    position = Point(x, y);
  }
}