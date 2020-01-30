import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:snake_game/user_story/painters/glow_line_painter.dart';

const glowHeight = 150.0;

class GlowLine extends StatefulWidget {
  final double height;
  final List<Color> colors;
  final List<double> stops;

  const GlowLine({Key key, this.height = 100.0, this.colors, this.stops}) : super(key: key);

  @override
  _GlowLineState createState() => _GlowLineState();
}

class _GlowLineState extends State<GlowLine> {
  Timer timer;
  double currentOffset = 0;


  @override
  void initState() {
    super.initState();
    currentOffset = -glowHeight;
    timer = Timer.periodic(Duration(milliseconds: 15), (timer) {
      setState(() {
        _computeOffset();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size:  MediaQuery.of(context).size,
      painter: GlowLinePainter(currentOffset),
    );
  }

  _computeOffset() {
    if (currentOffset > MediaQuery.of(context).size.height + glowHeight) {
      currentOffset = -glowHeight;
    } else {
      currentOffset += 2;
    }
  }
}