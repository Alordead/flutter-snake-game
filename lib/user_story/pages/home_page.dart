import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snake_game/models/game_model.dart';
import 'package:snake_game/models/game_state.dart';
import 'package:snake_game/user_story/common/app_theme.dart';
import 'package:snake_game/user_story/pages/starter/start_page.dart';
import 'package:snake_game/user_story/painters/game_painter.dart';
import 'package:snake_game/user_story/painters/score_cell_painter.dart';
import 'package:snake_game/user_story/painters/snake_painter.dart';
import 'package:snake_game/user_story/widgets/effects_layer.dart';
import 'package:snake_game/user_story/widgets/game_board.dart';

class HomePage extends StatelessWidget {
  final model = GameModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.current.backgroundColor,
      body: EffectsLayer(
        child: Center(
          child: StreamBuilder<GameState>(
            stream: model.updateStream,
            builder: (context, snapshot) {
              if (snapshot.data == GameState.notStarted ||
                  snapshot.hasData == false)
                return StartPage(
                  onStart: model.start,
                );
              if (snapshot.data == GameState.ended) return Container();
              return StreamBuilder<bool>(
                stream: model.needUpdateBoardStream,
                initialData: false,
                builder: (context, snapshot) {
                  return GameBoard(
                    score: model.score,
                    child: CustomPaint(
                      painter: GamePainter(
                        SnakePainter(model.snake),
                        ScoreCellPainter(model.scoreCell),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
