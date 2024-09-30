import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;
  // Avoid self isntance
  ColorsApp._();
  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0XFF00B4CC);

  Color get secondary => const Color(0XFF7C9094);

  Color get background => const Color(0XFFF7F9FA);

  Color get textPrimary => const Color(0XFF002429);
  Color get textSecondary => const Color(0XFF00B4CC);
  Color get textTernary => const Color(0XFF7C9094);
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
