import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snake_game/user_story/common/app_theme.dart';
import 'package:snake_game/user_story/common/text_styles.dart';

import 'dashed_rect.dart';

class StartButton extends StatefulWidget {
  final Function onTap;

  const StartButton({Key key, @required this.onTap}) : super(key: key);

  @override
  _StartButtonState createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  double scaleFactor = 1.0;
  Timer timer;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scaleFactor,
      child: CupertinoButton(
        onPressed: _onTap,
        padding: EdgeInsets.only(top: scaleFactor / 6),
        child: DashedRect(
          color: AppTheme.accentColor, strokeWidth: 2.0, gap: 3.0,
          child: Container(
            height: 50,
            width: 200,
            child: Center(child: Text("START", style: TextStyles.apple1977s36.copyWith(color: AppTheme.accentColor),),),
          ),
        ),
      ),
    );
  }

  _onTap() {
    timer = Timer.periodic(Duration(milliseconds: 350), (timer) {
      if (scaleFactor > 1000.0) {
        timer?.cancel();
        timer = null;
        widget.onTap();
      }
      setState(() {
        scaleFactor *= 4.0;
      });
    });
  }
}