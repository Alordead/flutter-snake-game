import 'package:flutter/material.dart';
import 'package:snake_game/user_story/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snake the Game',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}