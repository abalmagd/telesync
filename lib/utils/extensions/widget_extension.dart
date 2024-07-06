import 'package:flutter/material.dart';

extension TextUtils on Text {
  bool willTextOverflow({required double maxWidth}) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: data, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: maxWidth);

    return textPainter.didExceedMaxLines;
  }

  Size get textSize {
    final textPainter = TextPainter(
      text: TextSpan(text: data, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}