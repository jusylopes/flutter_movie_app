import 'package:flutter/material.dart';
import 'package:movie_app/utils/strings.dart';

Map<int, Color> _color = {
  50: const Color.fromRGBO(90, 4, 8, .1),
  100: const Color.fromRGBO(90, 4, 8, .2),
  200: const Color.fromRGBO(90, 4, 8, .3),
  300: const Color.fromRGBO(90, 4, 8, .4),
  400: const Color.fromRGBO(90, 4, 8, .5),
  500: const Color.fromRGBO(90, 4, 8, .6),
  600: const Color.fromRGBO(90, 4, 8, .7),
  700: const Color.fromRGBO(90, 4, 8, .8),
  800: const Color.fromRGBO(90, 4, 8, .9),
  900: const Color.fromRGBO(90, 4, 8, 1),
};

MaterialColor _colorCustom = MaterialColor(0xFFE50914, _color);

abstract class MovieTheme {
  static ThemeData get dark => ThemeData(
        primarySwatch: _colorCustom,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: MovieStrings.appFontFamily,
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 30.0, color: _colorCustom),
          titleMedium: const TextStyle(fontSize: 24.0, color: Colors.white),
          titleSmall: TextStyle(fontSize: 20.0, color: _colorCustom),
          bodyMedium: const TextStyle(fontSize: 14.0, color: Colors.white),
           bodySmall: const TextStyle(fontSize: 12.0, color: Colors.white),
        ),
        appBarTheme: const AppBarTheme(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        scaffoldBackgroundColor: const Color(0xff1b1b1b),
      );
}
