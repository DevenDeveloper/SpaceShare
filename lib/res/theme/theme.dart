import 'package:SpaceShare/res/theme/theme_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xEDD9B27C);
  static const Color primaryColorDark = Color(0xFFA5957E);
  static const Color badgeColor = Color(0xff1d2e3d);
  static const Color primaryColorVariant = Color(0x33394A6C);
  static const Color textColorRed = Color(0xFFE5001C);
  static const Color textColorDarkBLue = Color(0xFF1F2F40);
  static const Color textColorSkyBLue = Color(0xFF4a97cc);
  static const Color textColorYellow = Color(0xFFf7ba03);
  static const Color colorWhite = Color(0xFFEEDBC2);
  static const Color failRed = Color(0xFFFF0000);
  static AppColor get colors {
    return const AppColor.getColor();
  }

  static const primaryGradientColor = LinearGradient(
    colors: [Colors.white, AppTheme.primaryColor],
    stops: [0.0, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const primaryGradientColorGreen = LinearGradient(
    colors: [
      Color(0xFF4CAF50),
      Color(0xFF4CAF50),
    ],
    stops: [0.0, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const primaryGradientColorWhite = LinearGradient(
    colors: [
      Color(0xffffffff),
      Color(0xffffffff),
    ],
    stops: [0.0, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const buttonGradientColor = LinearGradient(
    colors: [
      Color(0xffffdc64),
      Color(0xffffdc64),
    ],
    stops: [0.0, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
