import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextTheme {
  static ThemeData textLight = ThemeData(
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      bodyMedium: GoogleFonts.poppins(
          color: Color(0xFF5D9CEC), fontSize: 18, fontWeight: FontWeight.w500),
      bodySmall: GoogleFonts.roboto(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
    ),
  );
  static ThemeData textDark = ThemeData(
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
      bodyMedium: GoogleFonts.poppins(
          color: Color(0xFF5D9CEC), fontSize: 18, fontWeight: FontWeight.w500),
      bodySmall: GoogleFonts.roboto(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
    ),
  );


}