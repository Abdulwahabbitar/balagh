import 'package:flutter/material.dart';
import '../theme_color/theme_light_color.dart';

ThemeData ThemeLightData() => ThemeData(
  primaryColor: ThemeLightColor.primaryColor,
  scaffoldBackgroundColor: Colors.transparent,

  colorScheme: const ColorScheme.light(
    primary: ThemeLightColor.primaryColor,
    onPrimary: ThemeLightColor.buttonTextColor,
    primaryContainer: ThemeLightColor.primaryLight,
    secondary: ThemeLightColor.secondaryColor,
    onSecondary: ThemeLightColor.textDark,
    secondaryContainer: ThemeLightColor.secondaryLight,
    surface: ThemeLightColor.backgroundColor,
    onSurface: ThemeLightColor.textColor,
    error: ThemeLightColor.errorColor,
    onError: ThemeLightColor.buttonTextColor,
    tertiary: ThemeLightColor.textLight,
  ),

  textTheme: const TextTheme(

    bodyLarge: TextStyle(
      color: ThemeLightColor.textColor,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      color: ThemeLightColor.textLight,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: ThemeLightColor.textLight,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      color: ThemeLightColor.titleColor,
      fontSize: 48,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: ThemeLightColor.textLight,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),

  appBarTheme: const AppBarTheme(
    color: ThemeLightColor.backgroundColor,
    titleTextStyle: TextStyle(
      color: ThemeLightColor.textDark,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(color: ThemeLightColor.textColor),
    elevation: 4,
    shadowColor: ThemeLightColor.shadowColor,
  ),

  buttonTheme: const ButtonThemeData(
    buttonColor: ThemeLightColor.buttonColor,
    disabledColor: ThemeLightColor.disabledButtonColor,
    textTheme: ButtonTextTheme.primary,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ThemeLightColor.buttonColor,
      foregroundColor: ThemeLightColor.buttonTextColor,
      disabledBackgroundColor: ThemeLightColor.disabledButtonColor,
      disabledForegroundColor: ThemeLightColor.textLight,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: ThemeLightColor.primaryColor,
      side: const BorderSide(color: ThemeLightColor.primaryColor),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
  ),

  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(ThemeLightColor.textColor),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: ThemeLightColor.surfaceColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: ThemeLightColor.borderColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: ThemeLightColor.borderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: ThemeLightColor.primaryColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: ThemeLightColor.errorColor, width: 2),
    ),
    hintStyle: const TextStyle(color: ThemeLightColor.textLight),
  ),

  dividerColor: ThemeLightColor.borderColor,
  shadowColor: ThemeLightColor.shadowColor,
  highlightColor: ThemeLightColor.highlightColor,
  splashColor: ThemeLightColor.splashColor,

  cardTheme: CardTheme(
    color: ThemeLightColor.cardColor,
    shadowColor: ThemeLightColor.shadowColor,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: const BorderSide(color: ThemeLightColor.borderColor),
    ),
  ),
);
