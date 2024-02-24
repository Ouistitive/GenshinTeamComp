
import 'package:flutter/material.dart';

class HexColor extends Color {

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if(hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class MyColors {
  static Color title = HexColor("#DEDEDE");
  static Color texteGris = HexColor("#B0BAC6");

  static Color texteFondCouleurPrimaire = HexColor("#505A66");

  static Color primaire = HexColor("#5555FF");
  static Color secondaire = HexColor("#FFC924");

}