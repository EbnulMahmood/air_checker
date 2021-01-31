import 'package:flutter/material.dart';

class ChangeColor {
  static Color getColor(int index) {
    if (index == 1)
      return Colors.green;
    else if (index == 2)
      return Colors.purple;
    else if (index == 3)
      return Colors.yellow;
    else if (index == 4)
      return Colors.orange;
    else if (index == 5) return Colors.red;
    return null;
  }
}
