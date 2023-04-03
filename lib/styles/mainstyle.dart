import 'package:flutter/material.dart';

var mainTheme = ThemeData(
    iconTheme: IconThemeData(color: Colors.white, size: 30, weight: 25),
    appBarTheme: AppBarTheme(
      elevation: 1,
      color: Colors.white,
      actionsIconTheme: IconThemeData(color:  Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
      iconTheme: IconThemeData(color: Colors.white)
    ),
    textTheme: TextTheme(headline1: TextStyle(color: Colors.white)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation:10,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black87
    )
);