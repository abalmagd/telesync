import 'package:flutter/material.dart';

extension HexColor on Color {
  String _generateAlpha({required int alpha, required bool withAlpha}) {
    if (withAlpha) {
      return alpha.toRadixString(16).padLeft(2, '0');
    } else {
      return '';
    }
  }

  String toHex({bool leadingHashSign = true, bool withAlpha = false}) {
    return '${leadingHashSign ? '#' : ''}'
        '${_generateAlpha(alpha: alpha, withAlpha: withAlpha)}'
        '${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}'
        .toUpperCase();
  }
}