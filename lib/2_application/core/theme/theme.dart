import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // static colors
  static const Color _lightBackgroundColor = Color(0xffFDFDFF);
  static const Color _lightContainerColor = Colors.white;
  static final Color _lightOnPrimaryColor = Colors.blueGrey.shade200;
  static const Color _lightTextColorPrimary = Colors.black;
  static const Color _appbarColorLight = Colors.white;

  static const Color _darkBackgroundColor = Color(0xff020617);
  static const Color _darkContainerColor = const Color(0xff161B2F);
  static const Color _darkPrimaryColor = Color(0xff1D1C68);
  static final Color _darkOnPrimaryColor = Colors.blueGrey.shade300;
  static const Color _darkTextColorPrimary = Colors.white;
  static final Color _appbarColorDark = Colors.blueGrey.shade800;

  static const Color _iconColor = Colors.white;

  static const Color _accentColor = Color.fromRGBO(74, 217, 217, 1);

  // Text Style - light
  static const TextStyle _lightHeadingText = TextStyle(
      color: _lightTextColorPrimary,
      fontFamily: "Rubik",
      fontSize: 20,
      fontWeight: FontWeight.bold);

  static const TextStyle _lightBodyText = TextStyle(
      color: _lightTextColorPrimary,
      fontFamily: "Rubik",
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      fontSize: 16);

  static const TextStyle _lightLargeText = TextStyle(
      color: _lightTextColorPrimary,
      fontFamily: "Rubik",
      // fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      fontSize: 24);

  static const TextTheme _lightTextTheme = TextTheme(
    headline1: _lightHeadingText,
    bodyText1: _lightBodyText,
    bodyText2: _lightLargeText,
  );

  // Text Style - dark
  static final TextStyle _darkThemeHeadingTextStyle =
      _lightHeadingText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeBodyeTextStyle =
      _lightBodyText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeLargeTextStyle =
      _lightLargeText.copyWith(color: _darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
      headline1: _darkThemeHeadingTextStyle,
      bodyText1: _darkThemeBodyeTextStyle,
      bodyText2: _darkThemeLargeTextStyle);

  // *****************
  // Theme light/dark
  // *****************

  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: _lightBackgroundColor,
      appBarTheme: const AppBarTheme(
          color: _lightBackgroundColor,
          iconTheme: IconThemeData(color: _iconColor)),
      bottomAppBarColor: _appbarColorLight,
      colorScheme: ColorScheme.light(
        primary: _lightBackgroundColor,
        onPrimary: _lightOnPrimaryColor,
        secondary: _accentColor,
        primaryContainer: _lightContainerColor,
      ),
      textTheme: _lightTextTheme);

  static final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: _darkBackgroundColor,
      appBarTheme: const AppBarTheme(
          color: _darkBackgroundColor,
          iconTheme: IconThemeData(color: _iconColor)),
      bottomAppBarColor: _appbarColorDark,
      colorScheme: ColorScheme.dark(
        primary: _darkPrimaryColor,
        secondary: _accentColor,
        onPrimary: _darkOnPrimaryColor,
        primaryContainer: _darkContainerColor,
      ),
      textTheme: _darkTextTheme);
}
