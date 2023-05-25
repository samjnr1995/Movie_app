import 'package:movie/theme/pallete.dart';
import 'package:flutter/material.dart';



class CustomTheme {
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(
          Pallete.red500.value,
          const {
            100: Pallete.red100,
            200: Pallete.red200,
            300: Pallete.red300,
            400: Pallete.red500,
            500: Pallete.red600,
            600: Pallete.red600,
            700: Pallete.red700,
            800: Pallete.red800,
            900: Pallete.red900,
          },
        ),
      ).copyWith(secondary: Pallete.red500),
      scaffoldBackgroundColor: Pallete.almostBlack,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Pallete.almostBlack,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: Colors.white,
        inactiveTrackColor: Colors.grey,
        thumbColor: Colors.white,
        valueIndicatorColor: Pallete.red500,
        inactiveTickMarkColor: Colors.transparent,
        activeTickMarkColor: Colors.transparent,

      ),
      textTheme: Theme.of(context).textTheme.apply(
        bodyColor: Colors.white,
        fontSizeFactor: 1.0,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Pallete.red500,
        ),
      ),
    );
  }
}
