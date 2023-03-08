import 'package:flutter/material.dart';

var mainTheme = ThemeData(
    iconTheme: IconThemeData(color: Colors.black, size: 30, weight: 25),
    appBarTheme: AppBarTheme(
      elevation: 1,
      color: Colors.white,
      actionsIconTheme: IconThemeData(color:  Colors.black),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
      iconTheme: IconThemeData(color: Colors.black)
    ),
    textTheme: TextTheme(headline1: TextStyle(color: Colors.black)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation:10,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black87
    )
);