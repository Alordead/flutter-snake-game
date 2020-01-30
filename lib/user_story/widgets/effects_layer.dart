import 'package:flutter/cupertino.dart';

import 'effects/glow_line.dart';
import 'effects/static_noise.dart';

class EffectsLayer extends StatelessWidget {
  final Widget child;

  const EffectsLayer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GlowLine(),
        StaticNoise(),
        child,
      ],
    );
  }
}