import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:snake_game/common/strings.dart';
import 'package:snake_game/helpers/game_mode_helper.dart';
import 'package:snake_game/helpers/theme_color_helper.dart';
import 'package:snake_game/user_story/common/app_theme.dart';
import 'package:snake_game/user_story/common/text_styles.dart';
import 'package:snake_game/user_story/pages/starter/start_page_view_model.dart';
import 'package:snake_game/user_story/widgets/start_button.dart';

class StartPage extends StatefulWidget {
  final Function onStart;

  StartPage({
    Key key,
    @required this.onStart,
  }) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final viewModel = StartPageViewModel();
  Timer timer;

  double scaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: viewModel.updateStream,
        builder: (context, snapshot) {
          return Transform.scale(
            scale: scaleFactor,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Center(child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(Strings.gameTitle.toUpperCase(), style: TextStyles.apple1977s36.copyWith(color: AppTheme.current.accentColor),),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(Strings.author, style: TextStyles.apple1977s16.copyWith(color: AppTheme.current.accentColor.withOpacity(0.7)),),
                      ),
                    ],
                  )),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      StartButton(onTap: _onStartTap, padding: EdgeInsets.only(top: scaleFactor / 6),),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            DefaultButton(onTap: () => viewModel.changeColor(context), text: ThemeColorHelper.letterBy(viewModel.themeColor),),
                            DefaultButton(onTap: viewModel.changeMode, text: GameModeHelper.letterBy(viewModel.gameMode.state),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

  _startAnimation(Function onCompletion) {
    timer = Timer.periodic(Duration(milliseconds: 350), (timer) {
      if (scaleFactor > 1000.0) {
        timer?.cancel();
        timer = null;
        onCompletion();
      }
      setState(() {
        scaleFactor *= 4.0;
      });
    });
  }

  /// MARK: Handlers
  _onStartTap() {
    _startAnimation(widget.onStart);
  }
}