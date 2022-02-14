import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MindPalaceTheme {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      // Matches manifest.json colors and background color.
      primaryColor: const Color(0xFF030303),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.subtitle1!.apply(color: _darkFillColor),
      ),
    );
  }

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFD3BCFF),
    primaryContainer: Color(0xFF5600CA),
    secondary: Color(0xFFF2C100),
    secondaryContainer: Color(0xFF584400),
    background: Color(0xFF1D1B1F),
    surface: Color(0xFF1D1B1F),
    onBackground: Color(0xFFE6E1E5),
    error: Color(0xFFFFB4A9),
    onError: Color(0xFF680003),
    onPrimary: Color(0xFF3C0092),
    onSecondary: Color(0xFF3D2E00),
    onSurface: Color(0xFFE6E1E5),
    brightness: Brightness.light,
  );

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFF7127EF),
    primaryContainer: Color(0xFFEBDDFF),
    secondary: Color(0xFF755B00),
    secondaryContainer: Color(0xFFFFE084),
    background: Color(0xFFFFFBFD),
    surface: Color(0xFFFFFBFD),
    onBackground: Color(0xFF1D1B1F),
    error: Color(0xFFBA1B1B),
    onError: Color(0xFFFFFFFF),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFF1D1B1F),
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    headline4: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 20.0),
    caption: GoogleFonts.oswald(fontWeight: _semiBold, fontSize: 16.0),
    headline5: GoogleFonts.oswald(fontWeight: _medium, fontSize: 16.0),
    subtitle1: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 16.0),
    overline: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 12.0),
    bodyText1: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 14.0),
    subtitle2: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 14.0),
    bodyText2: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 16.0),
    headline6: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 16.0),
    button: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 14.0),
  );

  static final TextTheme logoTextTheme =
      TextTheme(headline4: GoogleFonts.parisienne());
}
