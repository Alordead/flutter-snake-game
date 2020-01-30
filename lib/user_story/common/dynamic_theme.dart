import 'package:flutter/cupertino.dart';
import 'package:snake_game/models/theme_color.dart';

import 'app_theme.dart';

class DynamicTheme extends StatefulWidget {
  final ThemeColor defaultColor;
  final Widget child;

  const DynamicTheme({
    Key key,
    this.defaultColor,
    this.child,
  }) : super(key: key);

  static _DynamicThemeState of(BuildContext context) {
    return context.findAncestorStateOfType();
  }

  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  ThemeColor _color;

  @override
  void initState() {
    super.initState();
    _color = widget.defaultColor;
    AppTheme.from(_color);
  }

  setColor(ThemeColor color) {
    setState(() {
      _color = color;
    });
    AppTheme.from(_color);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}