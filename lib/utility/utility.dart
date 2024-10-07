

import 'dart:ui';

class Utility {

  static Color getHexColor(String hexValue){
    return Color(int.parse("0xFF$hexValue"));
  }
}