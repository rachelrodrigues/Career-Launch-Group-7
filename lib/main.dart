import 'package:flutter/material.dart';
import 'package:heart_insight/pages/home.dart';
import 'package:heart_insight/pages/enterInfo.dart';
import 'package:heart_insight/pages/result.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/home': (context) => Home(),
    '/enterInfo': (context) => EnterInfo(),
    //'/result': (context) => Result(),
  }
)); //MaterialApp
