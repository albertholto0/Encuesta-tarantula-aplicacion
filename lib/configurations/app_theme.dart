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
  primary: Color.fromRGBO(133, 194, 136, 1),
  onPrimary: Color.fromRGBO(13, 53, 16, 1),
  primaryContainer: Color.fromRGBO(30, 94, 34, 1),
  onPrimaryContainer: Color.fromRGBO(194, 232, 196, 1),
  secondary: Color.fromRGBO(232, 211, 92, 1),
  onSecondary: Color.fromRGBO(31, 43, 58, 1),
  secondaryContainer: Color.fromRGBO(117, 109, 0, 1),
  onSecondaryContainer: Color.fromRGBO(245, 233, 138, 1),
  tertiary: Color.fromRGBO(90, 219, 140, 1),
  onTertiary: Color.fromRGBO(0, 57, 26, 1),
  error: Color.fromRGBO(255, 180, 171, 1),
  onError: Color.fromRGBO(105, 0, 5, 1),
  surface: Color.fromRGBO(26, 38, 53, 1),
  onSurface: Color.fromRGBO(224, 227, 235, 1),
  outline: Color.fromRGBO(140, 140, 141, 1),
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
      fontSize: 18,
      color: lightColorScheme.onSurface,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 16,
      color: lightColorScheme.onSurface,
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
