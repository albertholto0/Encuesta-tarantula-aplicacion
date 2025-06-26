import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color.fromRGBO(33, 130, 37, 1),
  onPrimary: Color.fromRGBO(255, 255, 255, 1),
  primaryContainer: Color.fromRGBO(165, 214, 167, 1),
  onPrimaryContainer: Color.fromRGBO(10, 58, 13, 1),
  secondary: Color.fromRGBO(180, 164, 26, 1),
  onSecondary: Color.fromRGBO(19, 31, 46, 1),
  secondaryContainer: Color.fromRGBO(233, 229, 195, 1),
  onSecondaryContainer: Color.fromRGBO(58, 50, 0, 1),
  tertiary: Color.fromRGBO(17, 118, 59, 1),
  onTertiary: Color.fromRGBO(255, 255, 255, 1),
  error: Color.fromRGBO(186, 26, 26, 1),
  onError: Color.fromRGBO(255, 255, 255, 1),
  surface: Color.fromRGBO(233, 233, 230, 1),
  onSurface: Color.fromRGBO(19, 31, 46, 1),
  outline: Color.fromRGBO(119, 132, 156, 1),
);

final darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color.fromRGBO(100, 181, 246, 1),
  onPrimary: Color.fromRGBO(0, 29, 58, 1),
  primaryContainer: Color.fromRGBO(0, 75, 80, 1),
  onPrimaryContainer: Color.fromRGBO(170, 240, 240, 1),
  secondary: Color.fromRGBO(70, 200, 170, 1),
  onSecondary: Color.fromRGBO(0, 20, 15, 1),
  secondaryContainer: Color.fromRGBO(0, 30, 28, 1),
  onSecondaryContainer: Color.fromRGBO(150, 255, 220, 1),
  tertiary: Color.fromRGBO(120, 220, 180, 1),
  onTertiary: Color.fromRGBO(0, 30, 20, 1),
  error: Color.fromRGBO(255, 180, 180, 1),
  onError: Color.fromRGBO(80, 0, 0, 1),
  surface: Color.fromRGBO(15, 25, 35, 1),
  onSurface: Color.fromRGBO(220, 230, 245, 1),
  outline: Color.fromRGBO(80, 120, 150, 1),
);
final lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  useMaterial3: true,
  textTheme: GoogleFonts.interTextTheme().copyWith(
    bodySmall: GoogleFonts.inter(
      fontSize: 10,
      color: lightColorScheme.onSurface,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 12,
      color: lightColorScheme.onSurface,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 14,
      color: lightColorScheme.onSurface,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 20,
      color: lightColorScheme.onSurface,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 18,
      color: lightColorScheme.onSurface,
      fontWeight: FontWeight.bold,
    ),
  ),
  scaffoldBackgroundColor: lightColorScheme.surface,
);

final darkTheme = ThemeData(
  colorScheme: darkColorScheme,
  useMaterial3: true,
  textTheme: GoogleFonts.interTextTheme().copyWith(
    bodySmall: GoogleFonts.inter(
      fontSize: 10,
      color: darkColorScheme.onSurface,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 12,
      color: darkColorScheme.onSurface,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 14,
      color: darkColorScheme.onSurface,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 18,
      color: darkColorScheme.onSurface,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 16,
      color: darkColorScheme.onSurface,
    ),
  ),
  scaffoldBackgroundColor: darkColorScheme.surface,
);
