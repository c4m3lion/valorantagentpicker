import 'package:flutter/material.dart';

class Datas {
  static List<Agent> agents = List.empty(growable: true);
}

class Agent {
  String id = "NULL";
  String displayName = "";
  String fullPortrait = "";
  String bustPortrait = "";
  String background = "";
  String audio = "";
}

class MyColors {
  static Color background = const Color(0xff000000);
  static Color main = const Color(0xffFD4556);
  static Color blackred = const Color(0xff53212B);
  static Color orange = const Color(0xffE4572E);
  static Color green = const Color(0xff76B041);
  static Color white = Colors.white;
}
