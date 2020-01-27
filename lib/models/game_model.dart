import 'dart:async';

import 'package:snake_game/common/constants.dart';
import 'package:snake_game/models/snake.dart';

import 'cells/score_cell.dart';
import 'game_state.dart';

class GameModel {
  Snake snake = Snake(length: 3);
  ScoreCell scoreCell = ScoreCell();
  Timer timer;
  final shouldRepaintDuration = speedDuration;

  StreamController<GameState> _updateStateController = StreamController.broadcast();
  StreamController<bool> _needUpdateBoardController = StreamController.broadcast();

  Stream<GameState> get updateStream => _updateStateController.stream.asBroadcastStream();
  Stream<bool> get needUpdateBoardStream => _needUpdateBoardController.stream.asBroadcastStream();

  int _score;

  GameModel() {
    _updateStateController.add(GameState.notStarted);
  }

  start() {
    _updateStateController.add(GameState.started);
    snake.start();

    _score = 0;
    timer = Timer.periodic(shouldRepaintDuration, (timer) {
      _ifScoreCellAteLogic();
      _ifSnakeAteHimselfLogic();
      _needUpdateBoardController.add(true);
    });
  }

  _ifScoreCellAteLogic() {
    if (snake.head.position == scoreCell.position) {
      snake.growUp();
      incrementScore();
      scoreCell.randomizePosition();
    }
  }

  _ifSnakeAteHimselfLogic() {
    if (snake.eatsBody())
     gameOver();
  }

  restart() {

  }

  gameOver() {
    _needUpdateBoardController.add(false);
    _updateStateController.add(GameState.ended);

    snake.pause();
  }

  incrementScore() {
    _score++;
  }

  int get score => _score;
}