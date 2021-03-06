import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:snake_game/utils/direction.dart';

class SnakeController {
  final Function(Direction) onChangeDirection;
  SnakeController({@required this.onChangeDirection}) {
    _subscribeOnKeyEvents();
  }

  _subscribeOnKeyEvents() {
    RawKeyboard.instance.addListener(_onValueDidChanged);
  }

  _onValueDidChanged(RawKeyEvent value) {
    _notifyListenersIfNeeded(value);
  }

  _notifyListenersIfNeeded(RawKeyEvent value) {
    final direction = _directionFromKey(value);
    if (direction != null)
      _notifyListeners(direction);
  }

  Direction _directionFromKey(RawKeyEvent value) {
    final key = value.physicalKey;
    Direction direction;

    if (key == PhysicalKeyboardKey.keyW || key == PhysicalKeyboardKey.arrowUp)
      direction = Direction.top;
    else if (key == PhysicalKeyboardKey.keyD || key == PhysicalKeyboardKey.arrowRight)
      direction = Direction.right;
    else if (key == PhysicalKeyboardKey.keyS || key == PhysicalKeyboardKey.arrowDown)
      direction = Direction.bottom;
    else if (key == PhysicalKeyboardKey.keyA || key == PhysicalKeyboardKey.arrowLeft)
      direction = Direction.left;

    return direction;
  }

  /// MARK: Notifiers

  _notifyListeners(direction) {
    onChangeDirection(direction);
  }
}