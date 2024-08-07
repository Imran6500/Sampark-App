import 'package:flutter/material.dart';
import 'package:sampark/Config/Colors.dart';

//light theme

var lightTheme = ThemeData();

//dark theme
var darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: dBackgroundColor,
    appBarTheme: const AppBarTheme(backgroundColor: dContainerColor),
    inputDecorationTheme: const InputDecorationTheme(
        fillColor: dBackgroundColor,
        filled: true,
        border: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)))),
    colorScheme: const ColorScheme.dark(
        primary: dPrimaryColor,
        onPrimary: dOnBackgroundColor,
        surface: dBackgroundColor,
        onSurface: dOnBackgroundColor,
        primaryContainer: dContainerColor,
        onPrimaryContainer: dOnContainerColor,
        secondary: dsecondaryColor),

    //Text theme
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 32,
          color: dPrimaryColor,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w800),
      headlineMedium: TextStyle(
          fontSize: 30,
          color: dOnBackgroundColor,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(
          fontSize: 20,
          color: dOnBackgroundColor,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600),
      labelLarge: TextStyle(
          fontSize: 15,
          color: dOnContainerColor,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400),
      labelMedium: TextStyle(
          fontSize: 12,
          color: dOnContainerColor,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400),
      labelSmall: TextStyle(
          fontSize: 10,
          color: dOnContainerColor,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w300),
      bodyLarge: TextStyle(
          fontSize: 18,
          color: dOnBackgroundColor,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
          fontSize: 15,
          color: dOnBackgroundColor,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500),
    ));
