import 'package:flutter/material.dart';

class StyleData{
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Roboto',

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 38, 0, 255),
      brightness: Brightness.dark,
    ),
    
    //SCAFFOLD THEME
    scaffoldBackgroundColor: const Color.fromARGB(255, 39, 39, 39),
    
    //APPBAR THEME
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Color.fromARGB(255, 15, 15, 15),
      elevation: 4.0,
      shape: Border(
      bottom: BorderSide(
        color: Color.fromARGB(255, 129, 129, 129),
        width: 0.35,
        ),
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        letterSpacing: -0.5,
        fontFamily: 'Montserrat',
        fontSize: 20.0,
        fontVariations: [
          FontVariation(
            "wght",
            500,
            ),
        ],
      ),
    ),
    
    //DRAWER THEME
    drawerTheme: const DrawerThemeData(
      elevation: 4.0,
      backgroundColor: Color.fromARGB(255, 22, 22, 22),
      width: 235,
      shape: LinearBorder(),
    ),

    //LISTTILE THEME
    listTileTheme: const ListTileThemeData(
      dense: true,
      visualDensity: VisualDensity.compact,
      textColor: Color.fromARGB(255, 224, 224, 224),
      titleTextStyle: TextStyle(
        fontFamily: "Roboto",
      ),
    ),

    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.black,
      contentTextStyle: TextStyle(
        fontFamily: "Roboto",
        color: Colors.white,
      ),
    ),

    //INPUTFIELD THEME
    inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 2.0),
            border: OutlineInputBorder(),
            prefixIconColor: Color.fromARGB(255, 100, 100, 100),
            isDense: true,
            prefixStyle: TextStyle(
              color: Color.fromARGB(255, 221, 221, 221),
            ),
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 100, 100, 100),
              textBaseline: TextBaseline.alphabetic,
            ),
            floatingLabelAlignment: FloatingLabelAlignment.center,
    ),

    //BUTTON THEME
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: const TextStyle(fontSize: 16.0),
        visualDensity: VisualDensity.compact,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 40, 120, 255),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
        textStyle: const TextStyle(
          fontWeight: FontWeight.w300,
        ),
        visualDensity: VisualDensity.compact,
      ),
    ),

    //TEXT THEME
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        color: Color.fromARGB(255, 182, 182, 182),
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
      ),

      labelSmall: TextStyle(
        color: Colors.white,
        fontSize: 12.0,
        fontWeight: FontWeight.w300
      ),

      displayMedium: TextStyle(
        color: Color.fromARGB(255, 182, 182, 182),
        fontWeight: FontWeight.w300,
      ),

      displayLarge: TextStyle(
        color: Color.fromARGB(255, 224, 224, 224),
        fontSize: 18.0,
        fontWeight: FontWeight.w300
      ),

      titleLarge: TextStyle(
        color: Color.fromARGB(255, 175, 175, 175),
        fontSize: 20.0,
        fontWeight: FontWeight.w300,
        height: 1.25,
      ),
    ),

    
  );
}