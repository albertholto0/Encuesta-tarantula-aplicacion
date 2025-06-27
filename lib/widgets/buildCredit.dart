import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildCreditItem(
  BuildContext context,
  String role,
  String name,
  IconData icon,
) {
  return Column(
    children: [
      Icon(icon, size: 28, color: Theme.of(context).colorScheme.primary),
      SizedBox(height: 5),
      Text(
        role,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      Text(
        name,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
