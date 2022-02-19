// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:valorantagentpicker/datas.dart';
import 'package:valorantagentpicker/pages/home.dart';
import 'package:valorantagentpicker/pages/loading.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          backgroundColor: MyColors.background,
          scaffoldBackgroundColor: MyColors.background,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: MyColors.main,
            ),
          ),
          fontFamily: 'Valorant'),
      initialRoute: '/loading',
      routes: {
        '/home': (context) => HomePage(),
        '/loading': (context) => LoadingPage(),
      },
    ),
  );
}
