import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snake_game/common/constants.dart';
import 'package:snake_game/common/strings.dart';
import 'package:snake_game/user_story/common/app_theme.dart';
import 'package:snake_game/user_story/common/text_styles.dart';

class GameBoard extends StatelessWidget {
  final Widget child;
  final int score;

  const GameBoard({Key key, this.score, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16 * boardSize.width + 2,
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            "${Strings.currentScore} $score",
            textAlign: TextAlign.right,
            style:
                TextStyles.apple1977s16.copyWith(color: AppTheme.current.accentColor),
          ),
        ),
        Container(
          height: 16 * boardSize.height + 2,
          width: 16 * boardSize.width + 2,
          decoration:
              BoxDecoration(border: Border.all(color: AppTheme.current.accentColor)),
          child: child,
        ),
      ],
    );
  }
}
