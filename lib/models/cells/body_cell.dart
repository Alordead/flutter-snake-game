import 'dart:math';

import 'package:snake_game/common/constants.dart';
import 'package:snake_game/utils/direction.dart';

class BodyCell {
  int id;
  Point position;

  BodyCell(this.id);

  movePositionWithDirection(Direction direction) {
    switch (direction) {
      case Direction.top:
        position -= Point(0, 1);
        if (position.y < 0)
          position = Point(position.x, boardSize.height - 1);
        break;
      case Direction.right:
        position += Point(1, 0);
        if (position.x > boardSize.width - 1)
          position = Point(0, position.y);
        break;
      case Direction.bottom:
        position += Point(0, 1);
        if (position.y > boardSize.height - 1)
          position = Point(position.x, 0);
        break;
      case Direction.left:
        position -= Point(1, 0);
        if (position.x < 0)
          position = Point(boardSize.width - 1, position.y);
        break;
    }
  }

  moveToPosition(Point position) {
    this.position = position;
  }
}