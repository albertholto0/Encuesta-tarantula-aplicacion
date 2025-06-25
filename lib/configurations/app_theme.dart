import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(255, 119, 129, 216),
  surface: const Color.fromARGB(255, 228, 227, 253),
  primary: const Color.fromARGB(255, 149, 100, 246),
  secondary: const Color.fromARGB(255, 124, 131, 189),
);

final appTextTheme = GoogleFonts.poppinsTextTheme().copyWith(
  bodySmall: GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 12.0,
    color: appColorScheme.onSurface,
  ),
  bodyMedium: GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    color: appColorScheme.onSurface,
  ),
  bodyLarge: GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
    color: appColorScheme.onSurface,
  ),
  titleLarge: GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
    color: appColorScheme.onSurface,
  ),
  titleMedium: GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
    color: appColorScheme.onSurface,
  ),
  titleSmall: GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 14.0,
    color: appColorScheme.onSurface,
  ),
);

final appTheme = ThemeData().copyWith(
  scaffoldBackgroundColor: appColorScheme.surface,
  textTheme: appTextTheme,
  colorScheme: appColorScheme,
);
