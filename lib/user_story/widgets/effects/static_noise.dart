import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:snake_game/user_story/painters/static_noise_painter.dart';

class StaticNoise extends StatefulWidget {
  @override
  _StaticNoiseState createState() => _StaticNoiseState();
}

class _StaticNoiseState extends State<StaticNoise> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size:  MediaQuery.of(context).size,
      painter: StaticNoisePainter(),
    );
  }
}