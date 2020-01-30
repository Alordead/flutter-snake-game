import 'dart:ui';

import 'package:snake_game/models/theme_color.dart';

abstract class AppTheme {
  static AppTheme current;

  static AppTheme from(ThemeColor color) {
    switch (color) {
      case ThemeColor.purple:
        current = _PurpleTheme();
        break;
      case ThemeColor.green:
        current = _GreenTheme();
        break;
      case ThemeColor.blue:
        current = _BlueTheme();
        break;
    }
    return current;
  }

  Color get accentColor;
  Color get backgroundColor;
}

class _PurpleTheme extends AppTheme {
  @override
  get accentColor => const Color(0xFFF5009d);

  @override
  get backgroundColor => const Color(0xFF14101b);
}

class _BlueTheme extends AppTheme {
  @override
  get accentColor => const Color(0xFF4d7bd6);

  @override
  get backgroundColor => const Color(0xFF081118);
}

class _GreenTheme extends AppTheme {
  @override
  get accentColor => const Color(0xFF7cff4f);

  @override
  get backgroundColor => const Color(0xFF000000);
}