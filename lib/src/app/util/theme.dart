import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: avoid_classes_with_only_static_members
class CrudExampleTheme {
  static final theme = ThemeData();
  static final textTheme = GoogleFonts.senTextTheme();

  static ThemeData getTheme() {
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: const Color(0XFF00A8E8),
        secondary: const Color(0XFFd4b3af),
      ),
      sliderTheme: const SliderThemeData(
        thumbShape: RoundSliderThumbShape(elevation: 4, enabledThumbRadius: 12),
      ),
      textTheme: textTheme.apply(
//        bodyColor: defaultTextColor[700],
        bodyColor: const Color(0XFF3F414E),
      ),
      dividerTheme: const DividerThemeData(space: 0),
      scaffoldBackgroundColor: const Color(0XFFFFFFFF),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(fontFamily: 'Montserrat', color: Color(0XFF3F414E)),
        hintStyle:
            TextStyle(fontFamily: 'Montserrat', color: const Color(0XFF3F414E).withOpacity(0.5)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 20, horizontal: 36),
          ),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(
        color: Color(0XFFFFFFFF),
        elevation: 0,
        centerTitle: true,
        foregroundColor: Color(0XFF3F414E),
        titleTextStyle: TextStyle(
          fontFamily: 'Montserrat',
          color: Color(0XFF3F414E),
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
