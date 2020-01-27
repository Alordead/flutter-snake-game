import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:snake_game/common/constants.dart';
import 'package:snake_game/models/snake_controller.dart';
import 'package:snake_game/utils/direction.dart';
import 'package:snake_game/utils/direction_utils.dart';

import 'cells/body_cell.dart';

class Snake {
  SnakeController _controller;

  List<BodyCell> body = [];

  BodyCell get head => body.last;

  int get firstCellIndex => body.map((cell) => cell.id).reduce(max);
  int get lastCellIndex => body.map((cell) => cell.id).reduce(min);

  Timer timer;
  final moveDuration = speedDuration;

  Direction currentDirection = Direction.right;
  Direction nextDirection;

  Snake({int length = 1}) {
    _configureSnakeWith(length);
    _configureController();
  }

  start() {
    _configureTimer();
  }

  pause() {
    timer = null;
  }

  _configureSnakeWith(int length) {
    for (int i = 0; i < length; i++) {
      body.add(BodyCell(i)..position = Point(i, 0));
    }
  }

  _configureController() {
    _controller = SnakeController(onChangeDirection: _onChangeDirection);
  }

  _configureTimer() {
    timer = Timer.periodic(moveDuration, (timer) {
      _moveSnake();
    });
  }

  growUp() {
    body.forEach((cell) { cell.id += 1; });
    body.insert(0, BodyCell(0)..position = body.first.position);
  }

  _moveSnake() {
    if (nextDirection != null) {
      currentDirection = nextDirection;
      nextDirection = null;
    }

    Point previousPosition;

    for (int i = firstCellIndex; i >= lastCellIndex; i--) {
      final cell = body[i];
      if (i == firstCellIndex) {
        previousPosition = Point(cell.position.x, cell.position.y);
        cell.movePositionWithDirection(currentDirection);
      } else {
        final cellPosition = cell.position;
        cell.moveToPosition(previousPosition);
        previousPosition = cellPosition;
      }
    }
  }

  bool eatsBody() {
    bool eatsBody = false;

    for (int i = 0; i < body.length - 1; i++) {
      final cell = body[i];
      if (cell.position == head.position)
        eatsBody = true;
    }

    return eatsBody;
  }

  _onChangeDirection(Direction direction) {
    if (direction != DirectionUtils.opposite(currentDirection))
      this.nextDirection = direction;
  }
}