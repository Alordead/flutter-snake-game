import 'package:flutter/cupertino.dart';

class TextStyles {
  /// MARK: Fonts
  static TextStyle get apple1977 {
    return TextStyle(fontFamily: "Apple ][", fontWeight: FontWeight.w500);
  }
  /// MARK: Sizes
  static TextStyle get apple1977s16 {
    return apple1977.copyWith(fontSize: 16);
  }

  static TextStyle get apple1977s36 {
    return apple1977.copyWith(fontSize: 36);
  }
}