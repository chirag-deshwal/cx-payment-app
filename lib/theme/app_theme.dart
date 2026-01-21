import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors from Image
  static const Color kBackgroundColor =
      Color(0xFF0F0F11); // Very Dark, almost black
  static const Color kSurfaceColor = Color(0xFF1C1C1E); // Slightly lighter
  static const Color kLimeGreen = Color(0xFFD0F060); // Vibrant Lime
  static const Color kDeepPurple = Color(0xFF5060F0); // Vibrant Purple/Blue
  static const Color kWhite = Colors.white;
  static const Color kGrey = Color(0xFF8E8E93);

  // Background Compatibility & Aliases
  static const Color kPrimaryColor = kLimeGreen;
  static const Color kSecondaryColor = kDeepPurple;
  static const Color kErrorColor = Color(0xFFCF6679);

  // Gradients or Accents
  static const LinearGradient kBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF1E2215), // Dark greenish/black tint
      kBackgroundColor,
    ],
  );

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: kBackgroundColor,
      primaryColor: kLimeGreen,
      canvasColor: kBackgroundColor,
      colorScheme: const ColorScheme.dark(
        primary: kLimeGreen,
        secondary: kDeepPurple,
        surface: kSurfaceColor,
        background: kBackgroundColor,
        onPrimary: Colors.black, // Text on primary
        onSurface: kWhite,
      ),
      // Switch to 'Inter' or 'Manrope' for that modern tech look
      textTheme: GoogleFonts.manropeTextTheme(ThemeData.dark().textTheme).apply(
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
