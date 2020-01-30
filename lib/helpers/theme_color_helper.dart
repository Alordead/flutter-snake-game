import 'package:snake_game/models/theme_color.dart';

abstract class ThemeColorHelper {
  static ThemeColor nextColor(ThemeColor currentColor) {
    return ThemeColor.values[(currentColor.index + 1) % ThemeColor.values.length];
  }

  static String letterBy(ThemeColor color) {
    switch (color) {
      case ThemeColor.purple: return "P";
      case ThemeColor.blue: return "B";
      case ThemeColor.green: return "G";
      default: return "P";
    }
  }
}