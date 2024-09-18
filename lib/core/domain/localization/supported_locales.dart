import 'package:flutter/material.dart';

enum Languages { ar, en }

class SupportedLocales {
  static Map<String, Locale> supportedLocales = {
    Languages.en.name: Locale(Languages.en.name),
    Languages.ar.name: Locale(Languages.ar.name),
  };
}
