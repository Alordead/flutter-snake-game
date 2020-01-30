import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:snake_game/helpers/game_mode_helper.dart';
import 'package:snake_game/helpers/theme_color_helper.dart';
import 'package:snake_game/models/game_mode.dart';
import 'package:snake_game/models/theme_color.dart';
import 'package:snake_game/user_story/common/dynamic_theme.dart';

class StartPageViewModel {
  var themeColor = ThemeColor.values.first;
  final gameMode = GameMode.instance;

  StreamController<bool> _updateController = StreamController<bool>();
  Stream<bool> get updateStream => _updateController.stream;

  changeColor(BuildContext context) {
    themeColor = ThemeColorHelper.nextColor(themeColor);
    DynamicTheme.of(context).setColor(themeColor);
    _needUpdate();
  }

  changeMode() {
    gameMode.changeState(GameModeHelper.nextState(gameMode.state));
    _needUpdate();
  }

  _needUpdate() {
    _updateController.add(true);
  }
}