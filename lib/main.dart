import 'package:flutter/material.dart';
import 'package:snake_game/common/strings.dart';
import 'package:snake_game/user_story/common/dynamic_theme.dart';
import 'package:snake_game/user_story/pages/home_page.dart';

import 'models/theme_color.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultColor: ThemeColor.purple,
        child: MaterialApp(
            title: Strings.gameTitle,
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          ),
    );
  }
}