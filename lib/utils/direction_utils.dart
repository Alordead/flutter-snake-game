import 'direction.dart';

class DirectionUtils {
  static Direction opposite(Direction direction) {
    Direction oppositeDirection;

    switch (direction) {
      case Direction.top:
        oppositeDirection = Direction.bottom;
        break;
      case Direction.right:
        oppositeDirection = Direction.left;
        break;
      case Direction.bottom:
        oppositeDirection = Direction.top;
        break;
      case Direction.left:
        oppositeDirection = Direction.right;
        break;
    }

    return oppositeDirection;
  }
}