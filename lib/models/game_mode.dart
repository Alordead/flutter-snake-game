import 'game_mode_state.dart';

class GameMode {
  var state = GameModeState.easy;

  changeState(GameModeState newState) => state = newState;

  GameMode._();

  static GameMode instance = GameMode._();
}