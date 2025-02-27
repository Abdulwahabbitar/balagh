import 'package:flutter/material.dart';

import '../theme_color/theme_light_color.dart';

ThemeData ThemeLightData() => ThemeData(
      primaryColor: ThemeLightColor.primaryColor,
      colorScheme: const ColorScheme.light(
        primary: ThemeLightColor.primaryColor,
        secondary: ThemeLightColor.secondaryColor,
        surface: ThemeLightColor.backgroundColor,
        onSurface: ThemeLightColor.titleColor,
        tertiary: ThemeLightColor.textColor,

      ),
      scaffoldBackgroundColor: ThemeLightColor.backgroundColor,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
            color: ThemeLightColor.textColor,
            fontSize: 24,
            fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(color: ThemeLightColor.titleColor,fontSize: 16,
            fontWeight: FontWeight.w400),
        bodySmall: TextStyle(color: ThemeLightColor.textColor,fontSize: 14,
            fontWeight: FontWeight.w400),
      ),
      appBarTheme: const AppBarTheme(
        color: ThemeLightColor.backgroundColor,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: ThemeLightColor.secondaryColor,
      ),
  iconButtonTheme: IconButtonThemeData(style:ButtonStyle(foregroundColor: WidgetStatePropertyAll(ThemeLightColor.textColor) )));

