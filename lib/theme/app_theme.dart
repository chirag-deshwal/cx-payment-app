import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors
  static const Color kBackgroundColor = Color(0xFF000000); // Deep Black
  static const Color kSurfaceColor =
      Color(0xFF121212); // Slightly lighter for contrast
  static const Color kPrimaryColor = Color(0xFFBB86FC); // Neon Purple
  static const Color kSecondaryColor = Color(0xFF03DAC6); // Cyan
  static const Color kErrorColor = Color(0xFFCF6679);

  // Text Colors
  static const Color kWhite = Colors.white;
  static const Color kGrey = Colors.grey;

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: kBackgroundColor,
      primaryColor: kPrimaryColor,
      canvasColor: kBackgroundColor,
      colorScheme: const ColorScheme.dark(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
        surface: kSurfaceColor,
        background: kBackgroundColor,
        error: kErrorColor,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).apply(
        bodyColor: kWhite,
        displayColor: kWhite,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      iconTheme: const IconThemeData(color: kWhite),
      useMaterial3: true,
    );
  }
}
