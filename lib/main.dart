import 'package:flutter/material.dart';
import 'package:geting_started/pages/home.dart';
import 'package:geting_started/pages/profile.dart';
import 'package:geting_started/pages/settings.dart';
import 'package:geting_started/pages/tictactoe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      home: Home(),
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => Home(),
        '/settings': (BuildContext context) => Settings(),
        '/profile': (BuildContext context) => Profile(),
        '/tictactoe': (BuildContext context) => TicTacToe(),
      }
    );
  }
}

