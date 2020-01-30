import 'package:flutter/cupertino.dart';
import 'package:snake_game/user_story/common/app_theme.dart';
import 'package:snake_game/user_story/common/text_styles.dart';

import 'dashed_rect.dart';

class DefaultButton extends StatelessWidget {
  final Function onTap;
  final EdgeInsets padding;
  final String text;
  final Size size;

  const DefaultButton({
    Key key,
    @required this.onTap,
    this.text = "",
    this.size = const Size(50, 50),
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding: padding,
      child: DashedRect(
        color: AppTheme.current.accentColor,
        strokeWidth: 2.0,
        gap: 3.0,
        child: Container(
          height: size.height,
          width: size.width,
          child: Center(
            child: Text(
              text,
              style:
              TextStyles.apple1977s36.copyWith(color: AppTheme.current.accentColor),
            ),
          ),
        ),
      ),
    );
  }
}
