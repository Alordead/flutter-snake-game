import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snake_game/common/strings.dart';

import 'default_button.dart';

class StartButton extends StatelessWidget {
  final Function onTap;
  final EdgeInsets padding;

  const StartButton({Key key, @required this.onTap, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      onTap: onTap,
      size: Size(200, 50),
      padding: padding,
      text: Strings.startButtonTitle,
    );
  }
}