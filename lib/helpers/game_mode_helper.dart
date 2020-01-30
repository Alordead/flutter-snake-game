import 'package:snake_game/common/constants.dart';
import 'package:snake_game/models/game_mode_state.dart';

abstract class GameModeHelper {
  static GameModeState nextState(GameModeState currentState) {
    return GameModeState.values[(currentState.index + 1) % GameModeState.values.length];
  }

  static String letterBy(GameModeState mode) {
    switch (mode) {
      case GameModeState.easy: return "E";
      case GameModeState.normal: return "N";
      case GameModeState.hardcore: return "H";
      default: return "E";
    }
  }

  static Duration durationByState(GameModeState state) {
    switch (state) {
      case GameModeState.easy:
        return speedDurationEasy;
      case GameModeState.normal:
        return speedDurationNormal;
      case GameModeState.hardcore:
        return speedDurationHard;
      default: return speedDurationNormal;
    }
  }
}