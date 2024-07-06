import 'package:flutter/material.dart';

enum Palette {
  // General
  transparent(Color(0x00000000)),
  white(Color(0xFFFFFFFF)),
  black(Color(0xFF080808)),
  safe(Color(0xFF388e3c)),
  warning(Color(0xFFffa000)),
  danger(Color(0xFFd32f2f)),
  primary(Color(0xFF673ab7)),

  // Theme specific

  // Light theme
  scaffoldBgLight(Color(0xFFeeeeee)),

  // Dark theme
  scaffoldBgDark(Color(0xFF212121)),


  ;final Color color;

  const Palette(this.color);
}
