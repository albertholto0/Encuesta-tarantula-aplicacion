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
  primary: Color(0xFF7FB8F5),
  onPrimary: Color(0xFF002859),
  primaryContainer: Color(0xFF004A5E),
  onPrimaryContainer: Color(0xFFC4E7FF),
  secondary: Color(0xFF81D8D0),
  onSecondary: Color(0xFF003732),
  secondaryContainer: Color(0xFF004D47),
  onSecondaryContainer: Color(0xFFA0F0E8),
  tertiary: Color(0xFFA5D8A7),
  onTertiary: Color(0xFF00391C),
  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690005),
  surface: Color(0xFF121F28),
  onSurface: Color(0xFFE1E9F1),
  onSurfaceVariant: Color(0xFFC5D6E6),
  outline: Color(0xFF8E9DA8),
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
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 18,
      color: darkColorScheme.onSurface,
      fontWeight: FontWeight.bold,
    ),
  ),
  scaffoldBackgroundColor: darkColorScheme.surface,
);
